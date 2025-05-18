import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/constant.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class BottomSheetApp {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  OldAdders(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Directionality(
              textDirection: val.direction,
              child: FractionallySizedBox(
                heightFactor: 0.8,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${langLocal.langLocal['departure_point_details']!['${val.languagebox.get("language")}']}",
                                style: TextStyle(
                                    fontFamily: "Cairo", fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: colorsApp.colorgreen1,
                                child: Icon(
                                  Icons.pin_drop_outlined,
                                  color: colorsApp.colorbody,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          // height: 300,
                          child: val.addressSender == null
                              ? Center(child: CircularProgressIndicator())
                              : val.addressSender['status'] == false
                                  ? Center(
                                      child: NoData(),
                                    )
                                  : ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          val.addressSender['data'].length,
                                      itemBuilder: (context, i) {
                                        return MaterialButton(
                                          onPressed: () {
                                            //val.addressSender['data'][i]
                                            val.chosemyLocation(i);
                                          },
                                          padding: EdgeInsets.all(0),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: val.mylocation == i
                                                        ? 1
                                                        : 0.2),
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: ListTile(
                                              trailing: Image.asset(
                                                  "assets/images/oldaddress.png"),
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Text(
                                                        textAlign:
                                                            TextAlign.end,
                                                        "${val.addressSender['data'][i]['city_sender']}-${val.addressSender['data'][i]['neighborhood_sender']}-${val.addressSender['data'][i]['area_street_sender']}-${val.addressSender['data'][i]['build_number_sender']}",
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Cairo"),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              leading: IconButton(
                                                onPressed: () {
                                                  val.DeleteMyAddress(
                                                      val.addressSender['data']
                                                          [i]['id']);
                                                  dialogApp.checkdialog(context,
                                                      () {
                                                    Future.delayed(
                                                        Duration.zero, () {
                                                      if (context.mounted) {
                                                        dialogApp.checkdialog(
                                                            context, () {
                                                          if (context.mounted) {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }
                                                        });
                                                      }
                                                    });
                                                  });
                                                },
                                                icon: Container(
                                                  padding: EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50)),
                                                  child: Icon(
                                                      Icons.delete_outline),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ButtonApp(
                            title:
                                "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                            func: () {
                              if (val.mylocation > -1) {
                                Navigator.of(context).pop();
                                val.SwitchOrderScreen("reciverlocation");
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${langLocal.langLocal['select_location']!['${val.languagebox.get("language")}']}",
                                    ),
                                    duration: Duration(
                                        seconds: 3), // تختفي بعد 3 ثوانٍ
                                  ),
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  OldAddersResiver(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Directionality(
              textDirection: val.direction,
              child: FractionallySizedBox(
                heightFactor: 0.8,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InputAppSearch(
                            hint:
                                "${langLocal.langLocal['search_location']!['${val.languagebox.get("language")}']}",
                            controler: val.api.search,
                            icon: IconButton(
                                onPressed: () {
                                  val.AddressReciver();
                                },
                                icon: Icon(Icons.search)),
                            keyboard: TextInputType.number),
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${langLocal.langLocal['departure_point_details']!['${val.languagebox.get("language")}']}",
                                style: TextStyle(
                                    fontFamily: "Cairo", fontSize: 17),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              CircleAvatar(
                                backgroundColor: colorsApp.colorgreen1,
                                child: Icon(
                                  Icons.pin_drop_outlined,
                                  color: colorsApp.colorbody,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          // height: 300,
                          child: val.addressReciver == null
                              ? Center(child: CircularProgressIndicator())
                              : val.addressReciver['status'] == false
                                  ? Center(
                                      child: NoData(),
                                    )
                                  : ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount:
                                          val.addressReciver['data'].length,
                                      itemBuilder: (context, i) {
                                        return MaterialButton(
                                          onPressed: () {
                                            val.choseReciveLocation(i);
                                          },
                                          padding: EdgeInsets.all(0),
                                          child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width:
                                                        val.recivelocation == i
                                                            ? 1
                                                            : 0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                ListTile(
                                                  trailing: Image.asset(
                                                      "assets/images/oldaddress.png"),
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.end,
                                                          "${val.addressReciver['data'][i]['city_receiver']}-${val.addressReciver['data'][i]['neighborhood_receiver']}-${val.addressReciver['data'][i]['area_street_receiver']}-${val.addressReciver['data'][i]['build_number_receiver']}",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Cairo"),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  leading: IconButton(
                                                    onPressed: () {
                                                      val.DeleteReciverAddress(
                                                          val.addressReciver[
                                                              'data'][i]['id']);
                                                      dialogApp.checkdialog(
                                                          context, () {
                                                        Future.delayed(
                                                            Duration.zero, () {
                                                          if (context.mounted) {
                                                            dialogApp
                                                                .checkdialog(
                                                                    context,
                                                                    () {
                                                              if (context
                                                                  .mounted) {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              }
                                                            });
                                                          }
                                                        });
                                                      });
                                                    },
                                                    icon: Container(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(
                                                              width: 0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50)),
                                                      child: Icon(
                                                          Icons.delete_outline),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 30),
                                                  child: Text(
                                                    "${langLocal.langLocal['recipient']!['${val.languagebox.get("language")}']} :${val.addressReciver['data'][i]['name_receiver']}",
                                                    style: TextStyle(
                                                        fontFamily: "Cairo",
                                                        fontSize: 12),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 30,
                                                          bottom: 20),
                                                  child: Text(
                                                    "${langLocal.langLocal['phone']!['${val.languagebox.get("language")}']} : ${val.addressReciver['data'][i]['phone_receiver']}",
                                                    style: TextStyle(
                                                        fontFamily: "Cairo"),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ButtonApp(
                            title:
                                "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                            func: () {
                              if (val.mylocation > -1) {
                                val.CheckLocationReciver(
                                    val.lat_Re.toString(),
                                    val.long_Re.toString(),
                                    val.lat.toString(),
                                    val.long.toString());
                                dialogApp.checkdialog(context, () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
                                  val.SwitchOrderScreen("detailslocation");
                                });
                                // Navigator.of(context).pop();
                                // val.SwitchOrderScreen("detailslocation");
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "${langLocal.langLocal['select_pickup_location']!['${val.languagebox.get("language")}']}",
                                    ),
                                    duration: Duration(
                                        seconds: 3), // تختفي بعد 3 ثوانٍ
                                  ),
                                );
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  CompletMyAdders(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Directionality(
              textDirection: val.direction,
              child: Form(
                key: formstate,
                child: FractionallySizedBox(
                  heightFactor: 0.8,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context)
                            .viewInsets
                            .bottom, // تجنب تغطية لوحة المفاتيح
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              margin:
                                  EdgeInsets.only(right: 10, top: 30, left: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${langLocal.langLocal['departure_point_details']!['${val.languagebox.get("language")}']}",
                                    style: TextStyle(
                                        fontFamily: "Cairo", fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: colorsApp.colorgreen1,
                                    child: Icon(
                                      Icons.pin_drop_outlined,
                                      color: colorsApp.colorbody,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['country_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.cuntry,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['city_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.city,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['district_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.neighbor,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['street_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.street,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['building_number_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.build_number,
                                keyboard: TextInputType.number),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${langLocal.langLocal['saveLocation']!['${val.languagebox.get("language")}']}",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Checkbox(
                                    hoverColor: colorsApp.colorblackApp,
                                    activeColor: colorsApp.colorblackApp,
                                    value: val.savelocationSe,
                                    onChanged: (valu) {
                                      val.SaveLocationSe();
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonApp(
                                title:
                                    "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                                func: () {
                                  if (formstate.currentState!.validate()) {
                                    val.CheckLocationSender(val.lat.toString(),
                                        val.long.toString());
                                    dialogApp.checkdialog(context, () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      val.SwitchOrderScreen("reciverlocation");
                                    });
                                  } else {
                                    print("not validat");
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  CompletReciverAdders(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Directionality(
              textDirection: val.direction,
              child: FractionallySizedBox(
                heightFactor: 0.8,
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context)
                          .viewInsets
                          .bottom, // تجنب تغطية لوحة المفاتيح
                    ),
                    child: SingleChildScrollView(
                      child: Form(
                        key: formstate,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10, top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    "${langLocal.langLocal['pickup_point_details']!['${val.languagebox.get("language")}']}",
                                    style: TextStyle(
                                        fontFamily: "Cairo", fontSize: 17),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: colorsApp.colorgreen1,
                                    child: Icon(
                                      Icons.pin_drop_outlined,
                                      color: colorsApp.colorbody,
                                      size: 16,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['country_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.cuntry_Re,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['city_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.city_Re,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['district_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.neighbor_Re,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['street_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.street_Re,
                                keyboard: TextInputType.text),
                            InputLocation(
                                suf:
                                    "${langLocal.langLocal['building_number_label']!['${val.languagebox.get("language")}']}",
                                controler: val.api.build_number_Re,
                                keyboard: TextInputType.number),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${langLocal.langLocal['saveLocation']!['${val.languagebox.get("language")}']}",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                Checkbox(
                                    hoverColor: colorsApp.colorblackApp,
                                    activeColor: colorsApp.colorblackApp,
                                    value: val.savelocationRe,
                                    onChanged: (valu) {
                                      val.SaveLocationRe();
                                    })
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ButtonApp(
                                title:
                                    "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                                func: () {
                                  if (formstate.currentState!.validate()) {
                                    val.CheckLocationReciver(
                                        val.lat_Re.toString(),
                                        val.long_Re.toString(),
                                        val.lat.toString(),
                                        val.long.toString());
                                    dialogApp.checkdialog(context, () {
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                      val.SwitchOrderScreen("detailslocation");
                                    });
                                  } else {
                                    print("not validat");
                                  }
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  void showPickerOptions(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Consumer<Control>(builder: (context, val, child) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'اختر طريقة تحميل الصورة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade50,
                          child: Icon(Icons.photo_camera, color: Colors.blue),
                        ),
                        title: Text('التقاط صورة بالكاميرا'),
                        onTap: () => val.pickImageProdect(ImageSource.camera),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade50,
                          child: Icon(Icons.photo_library, color: Colors.green),
                        ),
                        title: Text('اختيار من المعرض'),
                        onTap: () => val.pickImageProdect(ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  void showPickerProfile(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Consumer<Control>(builder: (context, val, child) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'اختر طريقة تحميل الصورة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade50,
                          child: Icon(Icons.photo_camera, color: Colors.blue),
                        ),
                        title: Text('التقاط صورة بالكاميرا'),
                        onTap: () => val.pickImageProfile(ImageSource.camera),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade50,
                          child: Icon(Icons.photo_library, color: Colors.green),
                        ),
                        title: Text('اختيار من المعرض'),
                        onTap: () => val.pickImageProfile(ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }

  void showPickerProfileEdit(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Consumer<Control>(builder: (context, val, child) {
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'اختر طريقة تحميل الصورة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 20),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade50,
                          child: Icon(Icons.photo_camera, color: Colors.blue),
                        ),
                        title: Text('التقاط صورة بالكاميرا'),
                        onTap: () =>
                            val.pickImageProfileEdit(ImageSource.camera),
                      ),
                      Divider(),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade50,
                          child: Icon(Icons.photo_library, color: Colors.green),
                        ),
                        title: Text('اختيار من المعرض'),
                        onTap: () =>
                            val.pickImageProfileEdit(ImageSource.gallery),
                      ),
                    ],
                  ),
                ),
              );
            }));
  }
}
//MediaQuery.of(context).viewInsets.bottom,
