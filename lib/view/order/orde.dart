import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/bottomSheetApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/order/chosepay.dart';
import 'package:hawy_altawsil/view/order/detailsLocation.dart';
import 'package:hawy_altawsil/view/order/detailsOrder1.dart';
import 'package:hawy_altawsil/view/order/detailsOrder2.dart';
import 'package:hawy_altawsil/view/order/finish.dart';
import 'package:hawy_altawsil/view/order/mylocation.dart';
import 'package:hawy_altawsil/view/order/recievelocation.dart';
import 'package:hawy_altawsil/view/order/walet.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Order();
  }
}

class _Order extends State<Order> {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  BottomSheetApp bottomSheetApp = new BottomSheetApp();
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<Control>(context, listen: false).getPosion();
      await Provider.of<Control>(context, listen: false).getPosion_Re();
      await Provider.of<Control>(context, listen: false).AllRegion(context);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Scaffold(
          backgroundColor: colorsApp.colorbody,
          body: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            // margin: EdgeInsets.only(bottom: 25),
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            height: 175,
                            color: colorsApp.colorblackApp,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: colorsApp.colorbody,
                                  child: IconButton(
                                      onPressed: () {
                                        //Finish()// Walet()// ChosePay()
                                        // val.orderscreen == "mylocation"? val.SwitchOrderScreen("type")
                                        // :
                                        val.orderscreen == "reciverlocation"
                                            ? val.SwitchOrderScreen(
                                                "mylocation")
                                            : val.orderscreen ==
                                                    "detailslocation"
                                                ? val.SwitchOrderScreen(
                                                    "reciverlocation")
                                                : val.orderscreen == "details"
                                                    ? val.SwitchOrderScreen(
                                                        "detailslocation")
                                                    : val.orderscreen ==
                                                            "detailsorder2"
                                                        ? val.SwitchOrderScreen(
                                                            "details")
                                                        : val.orderscreen ==
                                                                "chosepayment"
                                                            ? val.SwitchOrderScreen(
                                                                "detailsorder2")
                                                            : val.orderscreen ==
                                                                    "walet"
                                                                ? val.SwitchOrderScreen(
                                                                    "chosepayment")
                                                                : Navigator.of(
                                                                        context)
                                                                    .pop();
                                        //val.orderscreen == "finish"?val.SwitchOrderScreen("walet");//
                                        // val.orderscreen == "type"
                                        //     ? ChoseTypeOrder()
                                        //     : val.orderscreen == "mylocation"
                                        //         ? MyLocation()
                                        //         : val.orderscreen == "reciverlocation"
                                        //             ? ReceverLocation()
                                        //             : val.orderscreen == "details"
                                        //                 ? DetailsOrder1()
                                        //                 : val.orderscreen == "detailsorder2"
                                        //                     ? DetailsOrder2()
                                        //                     : val.orderscreen ==
                                        //                             "detailslocation"
                                        //                         ? DetailsLocations()
                                        //                         : val.orderscreen ==
                                        //                                 "chosepayment"
                                        //                             ? ChosePay()
                                        //                             : SizedBox())
                                      },
                                      icon: Icon(Icons.keyboard_arrow_left)),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      "${langLocal.langLocal['create_new_order']!['${val.languagebox.get("language")}']}",
                                      style: TextStyle(
                                          fontFamily: "Cairo",
                                          color: colorsApp.colorbody,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 30),
                              height: 100,
                              width: 100,
                              child: Image.asset("assets/images/order.png"))
                        ],
                      ),
                      val.orderscreen == "mylocation" ||
                              val.orderscreen == "reciverlocation"
                          ? MaterialButton(
                              onPressed: () {
                                val.orderscreen == "mylocation"
                                    ? val.AddressSender()
                                    : val.AddressReciver();
                                val.orderscreen == "mylocation"
                                    ? bottomSheetApp.OldAdders(context)
                                    : bottomSheetApp.OldAddersResiver(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      val.orderscreen == "mylocation"
                                          ? "${langLocal.langLocal['choose_previous_senders']!['${val.languagebox.get("language")}']}"
                                          : "${langLocal.langLocal['choose_previous_receivers']!['${val.languagebox.get("language")}']}",
                                      style: TextStyle(
                                          fontFamily: "Cairo",
                                          color: colorsApp.colorbody),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.keyboard_arrow_down,
                                        color: colorsApp.colorbody)
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),

                  ////body
                  Expanded(
                      child:
                          //Finish()// Walet()// ChosePay()
                          // val.orderscreen == "type"
                          //     ? ChoseTypeOrder()
                          //     :
                          val.orderscreen == "mylocation"
                              ? MyLocation()
                              : val.orderscreen == "reciverlocation"
                                  ? ReceverLocation()
                                  : val.orderscreen == "details"
                                      ? DetailsOrder1()
                                      : val.orderscreen == "detailsorder2"
                                          ? DetailsOrder2()
                                          : val.orderscreen == "detailslocation"
                                              ? DetailsLocations()
                                              : val.orderscreen ==
                                                      "chosepayment"
                                                  ? ChosePay()
                                                  : val.orderscreen == "walet"
                                                      ? Walet()
                                                      : val.orderscreen ==
                                                              "finish"
                                                          ? Finish()
                                                          : SizedBox())
                ],
              )),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: val.orderscreen == "mylocation" ||
                  val.orderscreen == "reciverlocation"
              ? ButtonApp(
                  title:
                      "${langLocal.langLocal['next']!['${val.languagebox.get("language")}']}",
                  func: () {
                    val.orderscreen == "mylocation"
                        ? bottomSheetApp.CompletMyAdders(context)
                        : bottomSheetApp.CompletReciverAdders(context);
                  })
              : SizedBox(),
        ),
      );
    });
  }
}
