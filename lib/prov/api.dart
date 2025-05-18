import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class Api {
  String ip =
      "https://mangamediaa.com/tawsel-hawe/public"; //https://mangamediaa.com/tawsel-hawe/public "http://192.168.1.3/laravel/tawsel-hawe/public";
  late Box languagebox = Hive.box("language");
  TextEditingController phoneSignin = TextEditingController();
  TextEditingController passSignin = TextEditingController();
  var login;
  Future loginUser(String fcm_token) async {
    //User Created Successfully
    login = null;
    String uri = "$ip/api/login";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone": "${phoneSignin.text}",
        "password": "${passSignin.text}",
        "fcm_token": "${fcm_token}"
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        login = responsbody;
      } else {
        login = {'status': false, 'data': []};
      }
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
    } catch (e) {
      print(e);
    }
    return login;
  }

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  var registerUser;
  Future RegisterUser(int country_id) async {
    //User Created Successfully
    registerUser = null;
    String uri = "$ip/api/register";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "first_name": fname.text,
        "last_name": lname.text,
        "phone": "${phone.text}",
        "password": "${password.text}",
        "password_confirmation": "${confirmPassword.text}",
        "country_id": country_id.toString()
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        registerUser = responsbody;
      } else {
        registerUser = {'status': false, 'data': []};
      }
      print("register user : ${responsbody}");
      print("register user : ${responsbody}");
      print("register user : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return registerUser;
  }

  // TextEditingController code1 = TextEditingController();
  // TextEditingController code2 = TextEditingController();
  // TextEditingController code3 = TextEditingController();
  // TextEditingController code4 = TextEditingController();
  // TextEditingController code5 = TextEditingController();
  // TextEditingController code6 = TextEditingController();
  TextEditingController code = TextEditingController();

  var verfy;
  Future Verfy() async {
    verfy = null;
    String uri = "$ip/api/verify-otp";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone": "${phone.text}",
        "otp": "${code.text}",
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        verfy = responsbody;
      } else {
        verfy = {'status': false, 'data': []};
      }
      print("verfy : ${responsbody}");
      print("verfy : ${responsbody}");
      print("verfy : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return verfy;
  }

  TextEditingController resetPhone = TextEditingController();

  var resetphone;
  Future RestPhone() async {
    verfy = null;
    String uri = "$ip/api/forget-password";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone": "${resetPhone.text}",
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        resetphone = responsbody;
      } else {
        resetphone = {'status': false, 'data': []};
      }
      print("resetphone : ${responsbody}");
      print("resetphone : ${responsbody}");
      print("resetphone : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return resetphone;
  }

  var resetCode;
  Future ResetCode() async {
    resetCode = null;
    String uri = "$ip/api/verify-otp";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone": "${resetPhone.text}",
        "otp": "${code.text}",
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        resetCode = responsbody;
      } else {
        resetCode = {'status': false, 'data': []};
      }
      print("resetCode : ${responsbody}");
      print("resetCode. : ${responsbody}");
      print("resetCode. : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return resetCode;
  }

  TextEditingController newPass = TextEditingController();
  TextEditingController confirmNewPass = TextEditingController();
  var newpass;
  Future NewPass() async {
    newpass = null;
    String uri = "$ip/api/reset-password";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "password": "${newPass.text}",
        "password_confirmation": "${confirmNewPass.text}",
        "phone": " ${resetPhone.text}",
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        newpass = responsbody;
      } else {
        newpass = {'status': false, 'data': []};
      }
      print("newpass : ${responsbody}");
      print("newpass. : ${responsbody}");
      print("newpass. : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return newpass;
  }

  var restCodeRegister;
  Future resendCodeRegister() async {
    restCodeRegister = null;

    String uri = "$ip/api/resend-code";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone": "${phone.text}",
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        restCodeRegister = responsbody;
      } else {
        restCodeRegister = {'status': false, 'data': []};
      }
      print("restCodeRegister : ${responsbody}");
      print("restCodeRegister : ${responsbody}");
      print("restCodeRegister : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return restCodeRegister;
  }

  var resendCodeReset;
  Future ResendCodeReset() async {
    resendCodeReset = null;
    String uri = "$ip/api/resend-code";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone": "${resetPhone.text}",
      }, headers: {
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        resendCodeReset = responsbody;
      } else {
        resendCodeReset = {'status': false, 'data': []};
      }
      print("resendCodeReset : ${responsbody}");
      print("resendCodeReset : ${responsbody}");
      print("resendCodeReset : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return resendCodeReset;
  }

  TextEditingController city = TextEditingController();
  TextEditingController neighbor = TextEditingController();
  TextEditingController cuntry = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController build_number = TextEditingController();

  TextEditingController city_Re = TextEditingController();
  TextEditingController neighbor_Re = TextEditingController();
  TextEditingController cuntry_Re = TextEditingController();
  TextEditingController street_Re = TextEditingController();
  TextEditingController build_number_Re = TextEditingController();

  TextEditingController search = TextEditingController();

  TextEditingController nameRe = TextEditingController();
  TextEditingController phoneRe = TextEditingController();
  TextEditingController namePr = TextEditingController();
  TextEditingController decPr = TextEditingController();
  TextEditingController whait = TextEditingController();
  String coverStatus = "";

  var order;
  Order(
    File imageFileProdect,
    String token,
    String typecover,
    String typeorder,
    String lat_Re,
    String long_Re,
    String lat,
    String long,
    bool saveRe,
    bool saveSe,
    String area_sender_id,
    String area_receiver_id,
    String status_break,
  ) async {
    print(token);
    order = null;
    final dio = Dio();
    int saveR = saveRe ? 1 : 0;
    int saveS = saveSe ? 1 : 0;
    FormData formData = FormData.fromMap({
      "product_name": "${namePr.text}",
      'order_type': "$typeorder",
      'description': "${decPr.text}",
      'cover': "$typecover",
      'weight': whait.text,
      'save_receiver': saveR,
      'save_sender': saveS,
      'name_receiver': nameRe.text,
      'phone_receiver': phoneRe.text,
      'country_receiver': cuntry_Re.text,
      'city_receiver': city_Re.text,
      'neighborhood_receiver': neighbor_Re.text,
      'area_street_receiver': street_Re.text,
      'build_number_receiver': build_number_Re.text,
      'longitude_receiver': long_Re,
      'latitude_receiver': lat_Re,
      'country_sender': cuntry.text,
      'city_sender': city.text,
      'neighborhood_sender': neighbor.text,
      'area_street_sender': street.text,
      'build_number_sender': build_number.text,
      'longitude_sender': long,
      'latitude_sender': lat,
      "area_sender_id": area_sender_id,
      "area_receiver_id": area_receiver_id,
      "status_break": status_break,
      'image': await MultipartFile.fromFile(
        imageFileProdect.path,
        filename: imageFileProdect.path.split('/').last,
      ),
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/orders', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "lang": languagebox.get("language")
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        order = jsonDecode(response.toString());
        print('تم إضافة السائق بنجاح: ${response.data}');
      } else {
        print('فشل في إضافة السائق: ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return order;
  }

  var addressSender = null;
  Future AddressSender(String token) async {
    addressSender = null;
    String url = "$ip/api/address-sender";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (response.statusCode == 200 && !response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        addressSender = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        addressSender = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }
    return addressSender;
  }

  var addressReciver = null;
  Future AddressReciver(String token) async {
    addressReciver = null;
    String url = "$ip/api/address-receiver?phone_receiver=${search.text}";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (response.statusCode == 200 && !response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        addressReciver = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        addressReciver = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }
    return addressReciver;
  }

  Future AddressReciverFilter(String token) async {
    addressReciver = null;
    String url = "$ip/api/orders-filter?phone_receiver=${search.text}";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (response.statusCode == 200 && !response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        addressReciver = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        addressReciver = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }
    return addressReciver;
  }

  var deletmyaddress = null;
  Future DeletMyAddress(int id, String token) async {
    deletmyaddress = null;
    String url = "$ip/api/orders-delete-sender/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        deletmyaddress = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        deletmyaddress = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return deletmyaddress;
  }

  var deletReciveraddress = null;
  Future DeletReciverAddress(int id, String token) async {
    deletReciveraddress = null;
    String url = "$ip/api/orders-delete-receiver/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        deletReciveraddress = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        deletReciveraddress = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return deletReciveraddress;
  }

  var payment;
  Future Payment(String token, int id, String type) async {
    payment = null;
    String uri = "$ip/api/orders-payment/$id";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "type": type
      }, headers: {
        "accept": "application/json",
        'Authorization': 'Bearer $token',
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        payment = responsbody;
      } else {
        payment = {'status': false, 'data': []};
      }
      print("payment : ${responsbody}");
      print("payment : ${responsbody}");
      print("payment : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return payment;
  }

  var profile = null;
  Future Profile(String token) async {
    profile = null;
    String url = "$ip/api/profile";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        profile = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        profile = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return profile;
  }

  TextEditingController current_password = new TextEditingController();
  TextEditingController passwordEdit = new TextEditingController();
  TextEditingController password_confirmationEdit = new TextEditingController();
  var editProfile;
  EditProfile(
    File imageFileProdect,
    String token,
  ) async {
    print(token);
    editProfile = null;
    final dio = Dio();
    FormData formData = FormData.fromMap({
      "_method": "put",
      "current_password": current_password.text,
      "password": passwordEdit.text,
      "password_confirmation": password_confirmationEdit.text,
      'image': await MultipartFile.fromFile(
        imageFileProdect.path,
        filename: imageFileProdect.path.split('/').last,
      ),
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/editProfiles', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "lang": languagebox.get("language")
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        editProfile = jsonDecode(response.toString());
        print('تم إضافة السائق بنجاح: ${response.data}');
      } else {
        print('فشل في إضافة السائق: ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return editProfile;
  }

  var wallet = null;
  Future Wallet(String token) async {
    wallet = null;
    String url = "$ip/api/wallet/balance";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        wallet = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        wallet = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return wallet;
  }

  var allwallet = null;
  Future AllWallet(String token) async {
    wallet = null;
    String url = "$ip/api/wallet";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        allwallet = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        allwallet = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return allwallet;
  }

  TextEditingController amountRechargeWallet = new TextEditingController();
  var rechargewallet;
  Future RechargeWallet(String token) async {
    //User Created Successfully
    rechargewallet = null;
    String uri = "$ip/api/wallet/recharge";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "amount": "${amountRechargeWallet.text}",
      }, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "lang": languagebox.get("language")
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        rechargewallet = responsbody;
      } else {
        rechargewallet = {'status': false, 'data': []};
      }
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
    } catch (e) {
      print(e);
    }
    return rechargewallet;
  }

  var home = null;
  Future Home(String token) async {
    wallet = null;
    String url = "$ip/api/home";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        home = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        home = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return home;
  }

  var orders = null;
  Future OrderSender(String token) async {
    orders = null;
    String url = "$ip/api/order-sender";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        orders = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        orders = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return orders;
  }

  Future OrderReciver(String token) async {
    orders = null;
    String url = "$ip/api/orders-receiver";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        orders = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        orders = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return orders;
  }

  var showOrder = null;

  Future ShowOrder(String token, int id) async {
    showOrder = null;
    String url = "$ip/api/orders/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        showOrder = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        showOrder = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return showOrder;
  }

  var allRegion = null;
  Future AllRegion(String token) async {
    allRegion = null;
    String url = "$ip/api/user/areas";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language"),
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        allRegion = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print("regions $responsebody");
        print("regions $responsebody");
      }
    } catch (e) {
      print(e);
    }

    return allRegion;
  }

  var deleteRegion = null;
  Future DeleteRegion(int id) async {
    deleteRegion = null;
    String url = "$ip/api/admin/areas/$id";
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Accept-Language': "ar",
          'User-Agent':
              'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        deleteRegion = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print("regions $responsebody");
        print("regions $responsebody");
      }
    } catch (e) {
      print(e);
    }

    return deleteRegion;
  }

  var checkLcationSender;
  Future CheckLocationSender(String token, String latitude, String longitude,
      String status, String statusCheck) async {
    //User Created Successfully
    checkLcationSender = null;
    String uri = "$ip/api/check-coordinates";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "latitude": latitude,
        "longitude": longitude,
        "statusCheck": statusCheck,
        "status": status
      }, headers: {
        "lang": languagebox.get("language"),
        'Authorization': 'Bearer $token',
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        checkLcationSender = responsbody;
      } else {
        checkLcationSender = {'status': false, 'message': "error", 'data': []};
      }
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
    } catch (e) {
      print(e);
    }
    return checkLcationSender;
  }

  var checkLcationReciver;
  Future CheckLocationReciver(
      String token,
      String latitude,
      String longitude,
      String latitudeSender,
      String longitudeSender,
      String status,
      String statusCheck) async {
    //User Created Successfully
    checkLcationReciver = null;
    String uri = "$ip/api/check-coordinates";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "latitude": latitude,
        "longitude": longitude,
        "statusCheck": statusCheck,
        "status": status,
        "sender_latitude": latitudeSender,
        "sender_longitude": longitudeSender
      }, headers: {
        "lang": languagebox.get("language"),
        'Authorization': 'Bearer $token',
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        checkLcationReciver = responsbody;
      } else {
        checkLcationReciver = {'status': false, 'message': "error", 'data': []};
      }
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
    } catch (e) {
      print(e);
    }
    return checkLcationReciver;
  }

  var countries;
  Future Countries() async {
    countries = null;
    String url = "$ip/api/admin/countries";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        countries = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        countries = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return countries;
  }

  var rate = null;
  Future Rate(String token, int orderId, int stars) async {
    //User Created Successfully
    rate = null;
    String uri = "$ip/api/orders/rate";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "order_id": orderId.toString(),
        "rate": stars.toString(),
        "_method": "PUT"
      }, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "lang": languagebox.get("language"),
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        rate = responsbody;
      } else {
        rate = {'status': false, 'data': []};
      }
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
      print("sign in: ${responsbody}");
    } catch (e) {
      print(e);
    }
    return rate;
  }

  var cancel;
  Future Cancel(int id, String token) async {
    cancel = null;
    String url = "$ip/api/cancel-orders/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        cancel = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        cancel = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return cancel;
  }

  var notificat;
  Future Notificat(String token) async {
    notificat = null;
    String url = "$ip/api/notification/index";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        notificat = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        notificat = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return notificat;
  }

  var oneNotificat;
  Future OneNotificat(String token, int id) async {
    oneNotificat = null;
    String url = "$ip/api/notification/show/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        oneNotificat = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        oneNotificat = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return oneNotificat;
  }

  var countNotificat;
  Future CountNotificat(String token) async {
    countNotificat = null;
    String url = "$ip/api/notification/unread";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        countNotificat = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        countNotificat = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }

    return countNotificat;
  }

  TextEditingController orderNumber = new TextEditingController();
  TextEditingController message = new TextEditingController();
  var support = null;
  Future Support(String token) async {
    //User Created Successfully
    support = null;
    String uri = "$ip/api/complaints";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "orderNumber": orderNumber.text,
        "message": message.text
      }, headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "lang": languagebox.get("language"),
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        support = responsbody;
      } else {
        support = {'status': false, 'data': []};
      }
      print("suport: ${responsbody}");
      print("suport: ${responsbody}");
      print("suport: ${responsbody}");
    } catch (e) {
      print(e);
    }
    return support;
  }

  TextEditingController f_name_ed = new TextEditingController();
  TextEditingController l_name_ed = new TextEditingController();
  TextEditingController phone_ed = new TextEditingController();
  TextEditingController pass_old_ed = new TextEditingController();
  TextEditingController pass_new_ed = new TextEditingController();
  TextEditingController pass_conf_ed = new TextEditingController();

  var updateProfile = null;
  Future UpdateProfile(String token, File? image) async {
    //User Created Successfully
    final dio = Dio();
    updateProfile = null;

    ////
    FormData formData = FormData.fromMap({
      "_method": "put",
      "first_name": f_name_ed.text,
      "last_name": l_name_ed.text,
      "phone": phone_ed.text,
      "current_password": pass_old_ed.text,
      "password": pass_new_ed.text,
      "password_confirmation": pass_conf_ed.text,
      'image': image == null
          ? null
          : await MultipartFile.fromFile(
              image.path,
              filename: image.path.split('/').last,
            ),
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/profile', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
            "lang": languagebox.get("language")
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        updateProfile = jsonDecode(response.toString());
        print('تم إضافة  بنجاح: ${response.data}');
      } else {
        print('فشل في إضافة : ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
        updateProfile = dioError.response?.data;
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return updateProfile;
  }

  var logOut = null;
  Future LogOut(String token) async {
    //User Created Successfully
    logOut = null;
    String uri = "$ip/api/logout";
    try {
      var respons = await http.post(Uri.parse(uri), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
        "lang": languagebox.get("language"),
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        logOut = responsbody;
      } else {
        logOut = {'status': false, 'data': []};
      }
      print("logOut: ${responsbody}");
      print("logOut: ${responsbody}");
      print("logOut: ${responsbody}");
    } catch (e) {
      print(e);
    }
    return logOut;
  }

  var finish = null;
  Future Finish(String token, int id) async {
    finish = null;
    String url = "$ip/api/order-status/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
          "lang": languagebox.get("language")
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        finish = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      } else {
        finish = {'status': false, 'data': []};
      }
    } catch (e) {
      print(e);
    }
    return finish;
  }
}
