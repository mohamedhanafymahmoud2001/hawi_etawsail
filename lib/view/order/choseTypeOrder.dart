import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class ChoseTypeOrder extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "${langLocal.langLocal['select_delivery']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        color: colorsApp.colorgreen2,
                        fontSize: 18,
                        fontFamily: "Cairo"),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.white.withOpacity(0.0),
                    onTap: () {
                      val.choseTypeOrder("outside");
                    },
                    child: Container(
                      width: 150,
                      height: 120,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: val.typeOrder == "outside"
                              ? Border.all(width: 1.5)
                              : Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Row(
                          //   children: [
                          //     Expanded(child: SizedBox()),
                          //     Checkbox(
                          //         hoverColor: colorsApp.colorblackApp,
                          //         activeColor: colorsApp.colorblackApp,
                          //         value:
                          //             val.typeOrder == "outside" ? true : false,
                          //         onChanged: (valu) {}),
                          //   ],
                          // ),
                          Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/images/type1.png")),
                          Text(
                            textAlign: TextAlign.center,
                            "${langLocal.langLocal['delivery_outside_city']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    splashColor: Colors.white.withOpacity(0.0),
                    onTap: () {
                      val.choseTypeOrder("inside");
                    },
                    child: Container(
                      width: 150,
                      height: 120,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: val.typeOrder == "inside"
                              ? Border.all(width: 1.5)
                              : Border.all(width: 0.5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Row(
                          //   children: [
                          //     Expanded(child: SizedBox()),
                          //     Checkbox(
                          //         hoverColor: colorsApp.colorblackApp,
                          //         activeColor: colorsApp.colorblackApp,
                          //         value: val.typeOrder == "inside" ? true : false,
                          //         onChanged: (valu) {}),
                          //   ],
                          // ),
                          Container(
                              width: 35,
                              height: 35,
                              child: Image.asset("assets/images/type2.png")),
                          Text(
                            textAlign: TextAlign.center,
                            "${langLocal.langLocal['delivery_within_city']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // Expanded(
              //   child: SizedBox(),
              // ),
              SizedBox(
                height: 32,
              ),
              ButtonApp(
                  title:
                      "${langLocal.langLocal['next']!['${val.languagebox.get("language")}']}",
                  func: () {
                    // val.typeOrder
                    if (val.typeOrder != "") {
                      val.SwitchOrderScreen("mylocation");
                      Navigator.of(context).pushNamed("order");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${langLocal.langLocal['select_delivery']!['${val.languagebox.get("language")}']}",
                          ),
                          duration: Duration(seconds: 2), // تختفي بعد 3 ثوانٍ
                        ),
                      );
                    }
                  }),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      );
    });
  }
}
