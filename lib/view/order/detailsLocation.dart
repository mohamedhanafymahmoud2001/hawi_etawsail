import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class DetailsLocations extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10, top: 30, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: colorsApp.colorgreen1,
                    child: Icon(
                      Icons.pin_drop_outlined,
                      color: colorsApp.colorbody,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${langLocal.langLocal['departure_point_details']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(fontFamily: "Cairo", fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.cuntry.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['country_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.city.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['city_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.neighbor.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['district_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.street.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['street_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.build_number.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['building_number_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10, top: 30, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: colorsApp.colorgreen1,
                    child: Icon(
                      Icons.pin_drop_outlined,
                      color: colorsApp.colorbody,
                      size: 16,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "${langLocal.langLocal['pickup_point_details']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(fontFamily: "Cairo", fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.3),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.cuntry_Re.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['country_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.city_Re.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['city_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.neighbor_Re.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['district_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.street_Re.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['street_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(
                    //${val.api.cuntry}//
                    trailing: Text(
                      "${val.api.build_number_Re.text}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                    leading: Text(
                      "${langLocal.langLocal['building_number_label']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontFamily: "Cairo", fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ButtonApp(
                title:
                    "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                func: () {
                  val.SwitchOrderScreen("details");
                }),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      );
    });
  }
}
