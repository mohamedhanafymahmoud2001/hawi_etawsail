import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

class Walet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    DialogApp dialogApp = new DialogApp();
    return Consumer<Control>(builder: (context, val, child) {
      return val.wallet == null
          ? Center(child: CircularProgressIndicator())
          : val.wallet['status'] == false
              ? NoData()
              : Container(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "عملية الدفع",
                            style: TextStyle(
                                color: colorsApp.colorgreen2,
                                fontSize: 18,
                                fontFamily: "Cairo"),
                          )),
                      Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(20),
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 48, 48, 48),
                            ),
                            child: Image.asset(
                              "assets/images/waletback.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                              //backcart
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                "assets/images/backcart.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(20),
                            padding: EdgeInsets.all(10),
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                              //backcart
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      child: Image.asset(
                                          "assets/images/visapoint.png"),
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                          "رصيدك الحالي",
                                          style: TextStyle(
                                              color: colorsApp.colorbody,
                                              fontSize: 10,
                                              fontFamily: "Lemonada"),
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                          "${val.wallet['data']['currency']}",
                                          style: TextStyle(
                                              color: colorsApp.colorbody,
                                              fontSize: 14,
                                              fontFamily: "Lemonada"),
                                        )),
                                    Text(
                                      "${double.parse(val.wallet['data']['balance']).toInt()}",
                                      style: TextStyle(
                                          color: colorsApp.colorbody,
                                          fontSize: 32,
                                          fontFamily: "Lemonada"),
                                    ),
                                    Container(
                                      height: 35,
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        ".${val.wallet['data']['balance'][val.wallet['data']['balance'].length - 2]}${val.wallet['data']['balance'][val.wallet['data']['balance'].length - 1]}",
                                        style: TextStyle(
                                            color: colorsApp.colorbody,
                                            fontSize: 14,
                                            fontFamily: "Lemonada"),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: Container(
                                      alignment: Alignment.centerLeft,
                                      margin: EdgeInsets.all(10),
                                      child: Text(
                                        "${val.wallet['data']['name']}",
                                        style: TextStyle(
                                            color: colorsApp.colorbody,
                                            fontSize: 13,
                                            fontFamily: "Lemonada"),
                                      )),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 0.3)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "تكلفة التوصيل",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Cairo"),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "${val.order['data']['basePrice']}",
                                            style: TextStyle(
                                                color: colorsApp.colorgreen2,
                                                fontSize: 12,
                                                fontFamily: "Cairo"),
                                          )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "تكلفة التغليف",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: "Cairo"),
                                          )),
                                      Container(
                                          margin: EdgeInsets.all(10),
                                          child: Text(
                                            "${val.order['data']['coverPrice']}",
                                            style: TextStyle(
                                                color: colorsApp.colorgreen2,
                                                fontSize: 12,
                                                fontFamily: "Cairo"),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "التكلفة الكلية",
                                      style: TextStyle(
                                          fontSize: 14, fontFamily: "Cairo"),
                                    )),
                                Container(
                                    margin: EdgeInsets.all(10),
                                    child: Text(
                                      "${val.order['data']['totalPrice']}",
                                      style: TextStyle(
                                          color: colorsApp.colorgreen2,
                                          fontSize: 12,
                                          fontFamily: "Cairo"),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      ButtonApp(
                          title: 'اتمام الدفع',
                          func: () {
                            val.Payment();
                            dialogApp.checkdialog(context, () {
                              val.Finish();
                              Navigator.of(context).pop();
                              val.SwitchOrderScreen("finish");
                            });
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
