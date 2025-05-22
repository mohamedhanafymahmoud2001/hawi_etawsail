import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/order/cridet.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class ChosePay extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Column(
        children: [
          Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "${langLocal.langLocal['cost']!['${val.languagebox.get("language")}']}",
                style: TextStyle(
                    color: colorsApp.colorgreen2,
                    fontSize: 18,
                    fontFamily: "Cairo"),
              )),
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
                                "${langLocal.langLocal['deliveryCost']!['${val.languagebox.get("language")}']}",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Cairo"),
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
                                "${langLocal.langLocal['packagingService']!['${val.languagebox.get("language")}']}",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: "Cairo"),
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
                          "${langLocal.langLocal['allianceCost']!['${val.languagebox.get("language")}']}",
                          style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
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
          Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "${langLocal.langLocal['paymentType']!['${val.languagebox.get("language")}']}",
                style: TextStyle(
                    color: colorsApp.colorgreen2,
                    fontSize: 18,
                    fontFamily: "Cairo"),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  val.choseTypePay("credit");
                },
                child: Container(
                  width: 150,
                  height: 120,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.only(bottom: 10, left: 10),
                  decoration: BoxDecoration(
                      border: val.typePay == "credit"
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
                      //         value: val.typePay == "credit" ? true : false,
                      //         onChanged: (valu) {}),
                      //   ],
                      // ),
                      Container(
                          width: 35,
                          height: 35,
                          child: Image.asset("assets/images/cart.png")),
                      Text(
                        "${langLocal.langLocal['payment_credit_card']!['${val.languagebox.get("language")}']}",
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
                onTap: () {
                  val.choseTypePay("wallet");
                  print("walet");
                },
                child: Container(
                  width: 150,
                  height: 120,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.only(bottom: 10, left: 10),
                  decoration: BoxDecoration(
                      border: val.typePay == "wallet"
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
                      //         value: val.typePay == "wallet" ? true : false,
                      //         onChanged: (valu) {}),
                      //   ],
                      // ),
                      Container(
                          width: 35,
                          height: 35,
                          child: Image.asset("assets/images/walet.png")),
                      Text(
                        "${langLocal.langLocal['payment_app']!['${val.languagebox.get("language")}']}",
                        style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(),
          ),
          ButtonApp(
              title:
                  "${langLocal.langLocal['next']!['${val.languagebox.get("language")}']}",
              func: () {
                // val.typePay
                if (val.typePay != "") {
                  print("jj");

                  if (val.typePay == "credit") {
                    print("nn");
                    val.Payment();
                    dialogApp.checkdialog(context, () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //${val.linkPay}
                          builder: (context) => web(
                              paymentToken:
                                  "${val.payment['data']['payment_url']}"),
                        ),
                      );
                    });
                    // val.SwitchOrderScreen("web");
                  } else {
                    val.Wallet();
                    val.SwitchOrderScreen("walet");

                    // val.
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "${langLocal.langLocal['select_payment']!['${val.languagebox.get("language")}']}",
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
      );
    });
  }
}
