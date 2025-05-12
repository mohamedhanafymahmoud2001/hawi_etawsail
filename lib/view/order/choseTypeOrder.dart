import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

class ChoseTypeOrder extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "حدد نوع التوصيل",
                  style: TextStyle(
                      color: colorsApp.colorgreen2,
                      fontSize: 18,
                      fontFamily: "Cairo"),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    val.choseTypeOrder("outside");
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.only(bottom: 10, left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Checkbox(
                                hoverColor: colorsApp.colorblackApp,
                                activeColor: colorsApp.colorblackApp,
                                value:
                                    val.typeOrder == "outside" ? true : false,
                                onChanged: (valu) {}),
                          ],
                        ),
                        Container(
                            width: 35,
                            height: 35,
                            child: Image.asset("assets/images/type1.png")),
                        Text(
                          "توصيل خارج المدينة",
                          style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                        )
                      ],
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    val.choseTypeOrder("inside");
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.only(bottom: 10, left: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Checkbox(
                                hoverColor: colorsApp.colorblackApp,
                                activeColor: colorsApp.colorblackApp,
                                value: val.typeOrder == "inside" ? true : false,
                                onChanged: (valu) {}),
                          ],
                        ),
                        Container(
                            width: 35,
                            height: 35,
                            child: Image.asset("assets/images/type2.png")),
                        Text(
                          "توصيل داخل المدينة",
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
            SizedBox(height: 32,),
            ButtonApp(
                title: "التالي",
                func: () {
                  // val.typeOrder
                  if (val.typeOrder != "") {
                    val.SwitchOrderScreen("mylocation");
                    Navigator.of(context).pushNamed("order");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("اختر نوع التوصيل"),
                        duration: Duration(seconds:2), // تختفي بعد 3 ثوانٍ
                      ),
                    );
                  }
                }),
            SizedBox(
              height: 30,
            )
          ],
        ),
      );
    });
  }
}
