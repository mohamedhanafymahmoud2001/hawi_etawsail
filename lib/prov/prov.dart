import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/prov/api.dart';
import 'package:hive/hive.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class Control extends ChangeNotifier {
  var data;
  Api api = new Api();
  late Box languagebox = Hive.box("language");
  late Box tokenbox = Hive.box("token");
  String lang = "";
  TextDirection direction = TextDirection.rtl;
  initLang() {
    direction = languagebox.get("language") == "ar"
        ? TextDirection.rtl
        : TextDirection.ltr;
    notifyListeners();
  }

  choseLangouge(String value) {
    lang = value;
    languagebox.put("language", value);
    direction = languagebox.get("language") == "ar"
        ? TextDirection.rtl
        : TextDirection.ltr;

    notifyListeners();
  }

  shwatchLanguage() {
    languagebox.get("language") == "en"
        ? languagebox.put("language", "ar")
        : languagebox.put("language", "en");
    print(languagebox.get("language"));
    direction = languagebox.get("language") == "ar"
        ? TextDirection.rtl
        : TextDirection.ltr;
    notifyListeners();
  }

  String authentication = "signin";
  switchAuthentcation(String value) {
    authentication = value;
    notifyListeners();
  }

  bool passshow3 = true;
  PassShow3() {
    passshow3 = !passshow3;
    notifyListeners();
  }

  bool passshow2 = true;
  PassShow2() {
    passshow2 = !passshow2;
    notifyListeners();
  }

  bool passshow1 = true;
  PassShow1() {
    passshow1 = !passshow1;
    notifyListeners();
  }

  String auth = "login";
  SwitchAuth(String val) {
    auth = val;
    notifyListeners();
  }

  var fbm = FirebaseMessaging.instance;
  String tokendevice = '';
  GetTokenDevice() async {
    await fbm.requestPermission();
    fbm.getToken().then((value) {
      tokendevice = value!;
      print("token== $value");
      print("token== $value");
      print("token== $value");
    });
    notifyListeners();
  }

  //sender
  double lat = 0.0;
  double long = 0.0;

  Position? cl;
  Future getPosion() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    per = await Geolocator.checkPermission();
    print(per);
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.whileInUse) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
      } else if (per == LocationPermission.always) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
      }
    } else {
      if (per == LocationPermission.whileInUse) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
        // setCustomMarker();
      } else if (per == LocationPermission.always) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
        // setCustomMarker();
      }
    }
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  CameraPosition kGooglePlex = new CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.4746,
  );
  CameraPosition kGooglePlexUser = new CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  late GoogleMapController gmc;
  late Set<Marker> mymarker = {
    Marker(
        onTap: () {
          print("object");
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: "mohamed Hanafy"),
        markerId: MarkerId("1"),
        position: LatLng(cl!.latitude, cl!.longitude)),
  };
  List<Placemark> placemarks = [];
  Future getDetailsLocation(double lat, double long) async {
    placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks[0]);
    kGooglePlexUser = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    if (placemarks.isNotEmpty) {
      addDetailsToInput();
    }
    notifyListeners();
  }

  addDetailsToInput() {
    api.city.text = placemarks[0].administrativeArea ?? "";
    api.cuntry.text = placemarks[0].country ?? "";
    api.neighbor.text = placemarks[0].subAdministrativeArea ?? "";
    // api.street.text = placemarks[0].street ??"";
    notifyListeners();
  }

  pinMarcker(double lat, double long) async {
    mymarker = {
      Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(title: "mohamed Hanafy"),
          markerId: MarkerId("1"),
          position: LatLng(lat, long)),
    };
    getDetailsLocation(lat, long);
    notifyListeners();
  }

  //reciver
  double lat_Re = 0.0;
  double long_Re = 0.0;

  Position? cl_Re;
  Future getPosion_Re() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    per = await Geolocator.checkPermission();
    print(per);
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.whileInUse) {
        cl_Re = await getLatAndLong();
        print(cl_Re!.latitude);
        getDetailsLocation_Re(cl_Re!.latitude, cl_Re!.longitude);
        long_Re = cl_Re!.longitude;
        lat_Re = cl_Re!.latitude;
      } else if (per == LocationPermission.always) {
        cl_Re = await getLatAndLong();
        print(cl_Re!.latitude);
        getDetailsLocation_Re(cl_Re!.latitude, cl_Re!.longitude);
        long_Re = cl_Re!.longitude;
        lat_Re = cl_Re!.latitude;
      }
    } else {
      if (per == LocationPermission.whileInUse) {
        cl_Re = await getLatAndLong_Re();
        print(cl_Re!.latitude);
        getDetailsLocation_Re(cl_Re!.latitude, cl_Re!.longitude);
        long_Re = cl_Re!.longitude;
        lat_Re = cl_Re!.latitude;
        // setCustomMarker();
      } else if (per == LocationPermission.always) {
        cl_Re = await getLatAndLong_Re();
        print(cl_Re!.latitude);
        getDetailsLocation_Re(cl_Re!.latitude, cl_Re!.longitude);
        long_Re = cl_Re!.longitude;
        lat_Re = cl_Re!.latitude;
        // setCustomMarker();
      }
    }
  }

  Future<Position> getLatAndLong_Re() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  CameraPosition kGooglePlex_Re = new CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.4746,
  );
  CameraPosition kGooglePlex_ReUser = new CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> controller_Re =
      Completer<GoogleMapController>();
  late GoogleMapController gmc_Re;
  late Set<Marker> mymarker_Re = {
    Marker(
        onTap: () {
          print("object");
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: "mohamed Hanafy"),
        markerId: MarkerId("1"),
        position: LatLng(cl_Re!.latitude, cl_Re!.longitude)),
  };
  List<Placemark> placemarks_Re = [];
  Future getDetailsLocation_Re(double lat_Re, double long_Re) async {
    placemarks_Re = await placemarkFromCoordinates(lat_Re, long_Re);
    print(placemarks_Re[0]);
    kGooglePlex_ReUser = CameraPosition(
      target: LatLng(lat_Re, long_Re),
      zoom: 14.4746,
    );
    if (placemarks_Re.isNotEmpty) {
      addDetailsToInput_Re();
    }
    notifyListeners();
  }

  addDetailsToInput_Re() {
    api.city_Re.text = placemarks_Re[0].administrativeArea ?? "";
    api.cuntry_Re.text = placemarks_Re[0].country ?? "";
    api.neighbor_Re.text = placemarks_Re[0].subAdministrativeArea ?? "";
    // api.street.text = placemarks_Re[0].street ??"";
    notifyListeners();
  }

  pinMarcker_Re(double lat_Re, double long_Re) async {
    mymarker_Re = {
      Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(title: "mohamed Hanafy"),
          markerId: MarkerId("1"),
          position: LatLng(lat_Re, long_Re)),
    };
    getDetailsLocation_Re(lat_Re, long_Re);
    notifyListeners();
  }

  DialogApp dialogApp = new DialogApp();

  var allRegion = null;
  final Set<Circle> circless = {};
  List coordinates = [];
  late LatLng circleCenter;
  late Set<Marker> allmarker = {
    Marker(
        onTap: () {
          print("object");
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: "mohamed Hanafy"),
        markerId: MarkerId("f"),
        position: LatLng(0.0, 0.0)),
  };
  AllRegion(BuildContext context) async {
    allRegion = null;
    allRegion = await api.AllRegion(tokenbox.get("token"));
    allmarker.clear();
    circless.clear();
    if (allRegion != null) {
      print("qq1");
      print("qq1");
      if (allRegion['status'] == true && allRegion['data'].isNotEmpty) {
        circleCenter = LatLng(double.parse(allRegion['data'][0]['latitude']),
            double.parse(allRegion['data'][0]['longitude']));
        print("qq2");
        print("qq2");

        for (var coord in allRegion['data']) {
          print("qq3");
          print("qq3");
          //coordinates
          print("${coord}");
          circless.add(
            Circle(
              circleId: CircleId("${coord['id']}"),
              center: LatLng(double.parse(coord['latitude']!),
                  double.parse(coord['longitude']!)),
              radius: double.parse(coord['radius']), // نصف القطر بالمتر
              fillColor: Colors.red.withOpacity(0.3),
              strokeColor: Colors.red,
              strokeWidth: 2,
            ),
          );
          allmarker.add(
            Marker(
                onTap: () {
                  print("object");
                  print("${coord['id']}");
                  dialogApp.DeleteErea(context, "${coord['name']}", coord['id'],
                      () {
                    DeleteRegion(coord['id'], context);
                    Navigator.of(context).pop();
                    dialogApp.checkdialog(context, () {
                      Navigator.of(context).pop();
                    });
                  });
                },
                icon: BitmapDescriptor.defaultMarkerWithHue(
                    BitmapDescriptor.hueOrange),
                infoWindow: InfoWindow(title: "${coord['name']}"),
                markerId: MarkerId("${coord['id']}"),
                position: LatLng(double.parse(coord['latitude']!),
                    double.parse(coord['longitude']!))),
          );
        }
      }
    }

    notifyListeners();
  }

  var deleteRegion = null;
  DeleteRegion(int id, BuildContext context) async {
    deleteRegion = null;
    data = null;
    deleteRegion = await api.DeleteRegion(id);
    if (deleteRegion != null) {
      if (deleteRegion['message'] == "Region deleted successfully") {
        AllRegion(context);
      }
    }
    data = deleteRegion;
    notifyListeners();
  }

  //apis

  var register = null;
  RegisterUser() async {
    register = null;
    data = null;
    register = await api.RegisterUser(country_id);
    data = register;
    print(register);
    print(register);
    print(register);
    notifyListeners();
  }

  var login = null;
  loginUser() async {
    login = null;
    data = null;
    login = await api.loginUser(tokendevice);
    if (login != null) {
      if (login['status'] == true) {
        tokenbox.put("token", login['data']['token']);
      }
    }
    data = login;
    print(login);
    print(login);
    print(login);
    notifyListeners();
  }

  var verfy = null;
  Verfy() async {
    verfy = null;
    data = null;
    verfy = await api.Verfy();
    data = verfy;
    print(verfy);
    print(verfy);
    print(verfy);
    notifyListeners();
  }

  var restPhone = null;
  ResetPhone() async {
    restPhone = null;
    data = null;
    restPhone = await api.RestPhone();
    data = restPhone;
    print(restPhone);
    print(restPhone);
    print(restPhone);
    notifyListeners();
  }

  var restCode = null;
  ResetCode() async {
    restCode = null;
    data = null;
    restCode = await api.ResetCode();
    data = restCode;
    print(restCode);
    print(restCode);
    print(restCode);
    notifyListeners();
  }

  var newpass = null;
  NewPass() async {
    newpass = null;
    data = null;
    newpass = await api.NewPass();
    data = newpass;
    print(newpass);
    print(newpass);
    print(newpass);
    notifyListeners();
  }

  var resendCodeRegister = null;
  ResendCodeRegister() async {
    resendCodeRegister = null;
    data = null;
    resendCodeRegister = await api.resendCodeRegister();
    data = resendCodeRegister;
    print(resendCodeRegister);
    print(resendCodeRegister);
    print(resendCodeRegister);
    notifyListeners();
  }

  var resendCodeRest = null;
  ResendCodeRest() async {
    resendCodeRest = null;
    data = null;
    resendCodeRest = await api.ResendCodeReset();
    data = resendCodeRest;
    print(resendCodeRest);
    print(resendCodeRest);
    print(resendCodeRest);
    notifyListeners();
  }

  File? imageFileProdect;
  void uploadImageProdect() async {
    try {
      // فتح نافذة لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        imageFileProdect = File(result.files.single.path!);

        print(imageFileProdect!.path);
        print("image$imageFileProdect");
        notifyListeners();
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع الصورة: $e');
    }
    notifyListeners();
  }

  String typeOrder = "";
  choseTypeOrder(String valu) {
    typeOrder = valu;

    notifyListeners();
  }

  String orderscreen = "mylocation";
  SwitchOrderScreen(String valu) {
    orderscreen = valu;
    notifyListeners();
  }

  bool savelocationRe = false;
  SaveLocationRe() {
    savelocationRe = !savelocationRe;
    notifyListeners();
  }

  bool savelocationSe = false;
  SaveLocationSe() {
    savelocationSe = !savelocationSe;
    notifyListeners();
  }

  String typeCover = "";
  choseTypeCover(String valu) {
    typeCover = valu;

    notifyListeners();
  }

  String typeBreak = "";
  choseTypeBreak(String valu) {
    typeBreak = valu;

    notifyListeners();
  }

  increesWhiet() {
    if (api.whait.text == null || api.whait.text.isEmpty) {
      api.whait.text = "0";
    }
    api.whait.text = (int.parse(api.whait.text) + 1).toString();
  }

  decreesWhiet() {
    if (api.whait.text == null || api.whait.text.isEmpty) {
      api.whait.text = "0";
    }
    if (int.parse(api.whait.text) > 0)
      api.whait.text = (int.parse(api.whait.text) - 1).toString();
  }

  var order = null;
  Order() async {
    order = null;
    data = null;
    order = await api.Order(
      imageFileProdect!,
      tokenbox.get("token"),
      typeCover,
      typeOrder,
      lat_Re.toString(),
      long_Re.toString(),
      lat.toString(),
      long.toString(),
      savelocationRe,
      savelocationSe,
      idareasender.toString(),
      idareareciver.toString(),
      typeBreak,
    );
    data = order;

    print(order);
    notifyListeners();
  }

  String typePay = "";
  choseTypePay(String valu) {
    typePay = valu;

    notifyListeners();
  }

  int mylocation = -1;
  chosemyLocation(int valu) {
    mylocation = valu;
    api.cuntry.text = addressSender['data'][valu]['country_sender'];
    api.city.text = addressSender['data'][valu]['city_sender'];
    api.neighbor.text = addressSender['data'][valu]['neighborhood_sender'];
    api.street.text = addressSender['data'][valu]['area_street_sender'];
    api.build_number.text = addressSender['data'][valu]['build_number_sender'];
    lat = addressSender['data'][valu]['latitude_sender'];
    long = addressSender['data'][valu]['longitude_sender'];
    idareasender = addressSender['data'][valu]['area_sender_id'];
    savelocationSe = false;
    pinMarcker(lat, long);
    notifyListeners();
  }

  var addressSender = null;
  AddressSender() async {
    addressSender = null;
    addressSender = await api.AddressSender(tokenbox.get("token"));
    print(addressSender);
    print(addressSender);
    print(addressSender);
    notifyListeners();
  }

  int recivelocation = -1;
  choseReciveLocation(int valu) {
    recivelocation = valu;
    api.cuntry_Re.text = addressReciver['data'][valu]['country_receiver'];
    api.city_Re.text = addressReciver['data'][valu]['city_receiver'];
    api.street_Re.text = addressReciver['data'][valu]['area_street_receiver'];
    api.neighbor_Re.text =
        addressReciver['data'][valu]['neighborhood_receiver'];
    api.build_number_Re.text =
        addressReciver['data'][valu]['build_number_receiver'];
    lat_Re = addressReciver['data'][valu]['latitude_receiver'];
    long_Re = addressReciver['data'][valu]['longitude_receiver'];
    api.nameRe.text = addressReciver['data'][valu]['name_receiver'];
    api.phoneRe.text = addressReciver['data'][valu]['phone_receiver'];
    idareareciver = addressReciver['data'][valu]['area_receiver_id'];
    savelocationRe = false;
    pinMarcker(lat_Re, long_Re);
    notifyListeners();
  }

  var addressReciver = null;
  AddressReciver() async {
    addressReciver = null;
    notifyListeners();
    addressReciver = await api.AddressReciver(tokenbox.get("token"));
    print(addressReciver);
    print(addressReciver);
    print(addressReciver);
    notifyListeners();
  }

  AddressReciverFilter() async {
    addressReciver = null;
    notifyListeners();
    addressReciver = await api.AddressReciverFilter(tokenbox.get("token"));
    print(addressReciver);
    print(addressReciver);
    print(addressReciver);
    notifyListeners();
  }

  String ordertype = "send";
  SwitchOrderType(String valu) {
    ordertype = valu;
    notifyListeners();
  }

  var deletMyAddress;
  DeleteMyAddress(int id) async {
    deletMyAddress = null;
    deletMyAddress = await api.DeletMyAddress(id, tokenbox.get("token"));

    data = deletMyAddress;
    print("deletMyAddress = ${deletMyAddress}");
    print("deletMyAddress = ${deletMyAddress}");
    if (deletMyAddress != null) {
      if (deletMyAddress['status'] == true) {
        AddressSender();
      }
    }
    notifyListeners();
  }

  var deletReciverAddress;
  DeleteReciverAddress(int id) async {
    deletReciverAddress = null;
    deletReciverAddress =
        await api.DeletReciverAddress(id, tokenbox.get("token"));

    data = deletReciverAddress;
    print("deletReciverAddress = ${deletReciverAddress}");
    print("deletReciverAddress = ${deletReciverAddress}");
    if (deletReciverAddress != null) {
      if (deletReciverAddress['status'] == true) {
        AddressReciver();
      }
    }
    notifyListeners();
  }

  var payment;
  Payment() async {
    payment = null;
    data = null;
    payment =
        await api.Payment(tokenbox.get("token"), order['data']['id'], typePay);
    data = payment;
    print("payment = ${payment}");
    print("payment = ${payment}");
    notifyListeners();
  }

  var profile;
  Profile() async {
    profile = null;
    data = null;
    profile = await api.Profile(tokenbox.get("token"));

    data = profile;
    print("profile = ${profile}");
    print("profile = ${profile}");

    notifyListeners();
  }

  File? imageFileProfile;
  void uploadImageProfile() async {
    try {
      // فتح نافذة لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        imageFileProfile = File(result.files.single.path!);

        print(imageFileProfile!.path);
        print("image$imageFileProfile");
        notifyListeners();
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع الصورة: $e');
    }
    notifyListeners();
  }

  var editprofile;
  EditProfile() async {
    editprofile = null;
    data = null;
    editprofile =
        await api.EditProfile(imageFileProfile!, tokenbox.get("token"));

    data = editprofile;
    print("editprofile = ${editprofile}");
    print("editprofile = ${editprofile}");

    notifyListeners();
  }

  var wallet = null;
  Wallet() async {
    wallet = null;
    wallet = await api.Wallet(tokenbox.get("token"));
    print(wallet);
    print(wallet);
    print(wallet);
    notifyListeners();
  }

  var allwallet = null;
  AllWallet() async {
    allwallet = null;
    allwallet = await api.AllWallet(tokenbox.get("token"));
    print(allwallet);
    print(allwallet);
    print(allwallet);
    notifyListeners();
  }

  increesRechargeWallet() {
    if (api.amountRechargeWallet.text == null ||
        api.amountRechargeWallet.text.isEmpty) {
      api.amountRechargeWallet.text = "0";
    }
    api.amountRechargeWallet.text =
        (int.parse(api.amountRechargeWallet.text) + 10).toString();
  }

  decreesRechargeWallet() {
    if (api.amountRechargeWallet.text == null ||
        api.amountRechargeWallet.text.isEmpty) {
      api.amountRechargeWallet.text = "0";
    }
    if (int.parse(api.amountRechargeWallet.text) > 9)
      api.amountRechargeWallet.text =
          (int.parse(api.amountRechargeWallet.text) - 10).toString();
  }

  var rechargewallet = null;
  RechargeWallet() async {
    rechargewallet = null;
    data = null;
    rechargewallet = await api.RechargeWallet(tokenbox.get("token"));
    data = rechargewallet;
    print(rechargewallet);
    print(rechargewallet);
    print(rechargewallet);
    notifyListeners();
  }

  final PageController pageController = PageController();
  int currentIndex = 0;
  ChangeScreenMain(int valu) {
    currentIndex = valu;
    pageController
        .animateToPage(
      valu,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    )
        .then((_) {
      notifyListeners();
    });
  }

  void animateToPage(int page) {
    if (pageController.hasClients) {
      // ✅ التحقق من أن PageController متصل
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );
      currentIndex = page; // ✅ تحديث الـ index
      notifyListeners();
    } else {
      debugPrint("🚨 PageController لم يتم توصيله بعد بـ PageView!");
    }
  }

  var home = null;
  Home() async {
    home = null;
    home = await api.Home(tokenbox.get("token"));
    if (home != null) {
      if (home['status'] == true) {
        print("object");
        print("object");
        print("object");
      }
      if (home['message'] == "Unauthenticated") {
        //unauthentecation
        tokenbox.put("token", "");
      }
    }
    print(home);
    print(home);
    print(home);
    notifyListeners();
  }

  var orders = null;
  OrderSender() async {
    orders = null;
    orders = await api.OrderSender(tokenbox.get("token"));
    print(orders);
    print(orders);
    print(orders);
    notifyListeners();
  }

  OrderReciver() async {
    orders = null;
    orders = await api.OrderReciver(tokenbox.get("token"));
    print(orders);
    print(orders);
    print(orders);
    notifyListeners();
  }

  var showOrder = null;
  int idorder = 0;
  ShowOrder(int id) async {
    idorder = id;
    showOrder = null;
    showOrder = await api.ShowOrder(tokenbox.get("token"), id);
    print(showOrder);
    print(showOrder);
    print(showOrder);
    notifyListeners();
  }

  var countries = null;
  Countries() async {
    countries = null;
    countries = await api.Countries();
    print(countries);
    print(countries);
    print(countries);
    notifyListeners();
  }

  int country_id = -1;
  choseCountry_id(int value) {
    country_id = value;
    notifyListeners();
  }

  var checklocationSender = null;

  int idareasender = -1;
  CheckLocationSender(String latitude, String longitude) async {
    checklocationSender = null;
    data = null;
    checklocationSender = await api.CheckLocationSender(
        tokenbox.get("token"), latitude, longitude, typeOrder, "sender");
    if (checklocationSender != null) {
      if (checklocationSender['status'] == true) {
        idareasender = checklocationSender['data']['area_sender_id'];
      }
    }
    data = checklocationSender;
    print(checklocationSender);
    print(checklocationSender);
    print(checklocationSender);
    notifyListeners();
  }

  var checklocationReciver = null;
  int idareareciver = -1;
  CheckLocationReciver(String latitude, String longitude, String latitudeSender,
      String longitudeSender) async {
    checklocationReciver = null;
    data = null;
    checklocationReciver = await api.CheckLocationReciver(
        tokenbox.get("token"),
        latitude,
        longitude,
        latitudeSender,
        longitudeSender,
        typeOrder,
        "receiver");
    if (checklocationReciver != null) {
      if (checklocationReciver['status'] == true) {
        idareareciver = checklocationReciver['data']['area_receiver_id'];
      }
    }
    data = checklocationReciver;
    print(checklocationReciver);
    print(checklocationReciver);
    print(checklocationReciver);

    notifyListeners();
  }

  String switchdetailscontainer = "rate";
  SwitchDetailsContainer(String valu) {
    switchdetailscontainer = valu;
    notifyListeners();
  }

  int rate = 0;
  Rate(int value) {
    rate = value;
    notifyListeners();
  }

  var addRate = null;
  AddRate() async {
    addRate = null;
    data = null;
    addRate =
        await api.Rate(tokenbox.get("token"), showOrder['data']['id'], rate);
    data = addRate;
    if (addRate != null) {
      if (addRate['status'] == true) {
        ShowOrder(idorder);
        SwitchDetailsContainer("details");
      }
    }
    print(addRate);
    print(addRate);
    print(addRate);
    notifyListeners();
  }

  var cancel = null;
  Cancel() async {
    cancel = null;
    data = null;
    cancel = await api.Cancel(showOrder['data']['id'], tokenbox.get("token"));
    data = cancel;
    if (cancel != null) {
      if (cancel['status'] == true) {
        ShowOrder(idorder);
        SwitchDetailsContainer("details");
      }
    }
    print(cancel);
    print(cancel);
    print(cancel);
    notifyListeners();
  }

  var notificat;
  Notificat() async {
    notificat = null;
    notificat = await api.Notificat(tokenbox.get("token"));
    print(notificat);
    print(notificat);
    print(notificat);
    notifyListeners();
  }

  var oneNotificat;
  OneNotificat(int id, int i) async {
    oneNotificat = null;
    oneNotificat = await api.OneNotificat(tokenbox.get("token"), id);
    if (oneNotificat != null) {
      if (oneNotificat['status'] == true) {
        notificat['data'][i]['is_read'] = 1;
        Home();
      }
    }
    print(oneNotificat);

    print(oneNotificat);
    print(oneNotificat);
    notifyListeners();
  }

  var support = null;
  Support() async {
    support = null;
    data = null;
    support = await api.Support(tokenbox.get("token"));
    if (support != null) {
      if (support['status'] == true) {
        api.orderNumber.text = "";
        api.message.text = "";
      }
    }
    data = support;
    print(support);
    print(support);
    print(support);
    notifyListeners();
  }

  File? imageFileProfileEdite;
  void uploadImageProfileEdite() async {
    try {
      // فتح نافذة لاختيار ملف
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        imageFileProfileEdite = File(result.files.single.path!);

        print(imageFileProfileEdite!.path);
        print("image$imageFileProfileEdite");
        notifyListeners();
      }
    } catch (e) {
      print('حدث خطأ أثناء رفع الصورة: $e');
    }
    notifyListeners();
  }

  var updateProfile = null;
  UpdateProfile() async {
    updateProfile = null;
    data = null;
    updateProfile =
        await api.UpdateProfile(tokenbox.get("token"), imageFileProfileEdite);
    if (updateProfile != null) {
      if (updateProfile['status'] == true) {
        Profile();
        Home();
        imageFileProfileEdite = null;
      }
    }
    data = updateProfile;
    print(updateProfile);
    print(updateProfile);
    print(updateProfile);
    notifyListeners();
  }

  var logOut = null;
  LogOut() async {
    logOut = null;
    data = null;
    logOut = await api.LogOut(tokenbox.get("token"));
    if (logOut != null) {
      if (logOut['status'] == true) {
        tokenbox.put("token", "");
      }
    }
    data = logOut;
    print(logOut);
    print(logOut);
    print(logOut);
    notifyListeners();
  }

  var finish = null;
  Finish() async {
    finish = null;
    finish = await api.Finish(tokenbox.get("token"), order['data']['id']);
    print(finish);
    print(finish);
    print(finish);
    notifyListeners();
  }

  call(String number) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: '$number',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('error');
    }
  }
}
