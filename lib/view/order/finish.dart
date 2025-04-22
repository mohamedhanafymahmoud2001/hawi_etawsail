import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/app_text_style.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/main/main_view.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class Finish extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return val.finish == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : val.finish['data']['status'] != "success"
              ? Column(
                  children: [
                    Expanded(
                      child: SizedBox(),
                      flex: 4,
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.only(bottom: 20),
                      child: Image.asset(
                        "assets/images/error.png",
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      "${langLocal.langLocal['payment_failed']!['${val.languagebox.get("language")}']}",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style16W600(context),
                    ),
                    Expanded(flex: 5, child: SizedBox()),
                    ButtonApp(
                        title:                "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                        func: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //${val.linkPay}
                              builder: (context) => MainView(),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 30,
                    )
                  ],
                )
              : Container(
                  child: Column(
                    children: [
                      Expanded(flex: 1, child: SizedBox()),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            "${langLocal.langLocal['order_created_successfully']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(
                                color: colorsApp.colorgreen2,
                                fontSize: 18,
                                fontFamily: "Cairo"),
                          )),
                      Container(
                          height: 70,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 0.3)),
                          child: Center(
                            child: Text(
                              "ID : ${val.order['data']['orderNumber']}",
                              style:
                                  TextStyle(fontSize: 18, fontFamily: "Cairo"),
                            ),
                          )),
                      Container(
                          height: 70,
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(width: 0.3)),
                          child: Center(
                            child: Text(
                              "Secret Key:  ${val.order['data']['secret_key']}",
                              style:
                                  TextStyle(fontSize: 18, fontFamily: "Cairo"),
                            ),
                          )),
                      Expanded(flex: 5, child: SizedBox()),
                      ButtonApp(
                          title:               "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                          func: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //${val.linkPay}
                                builder: (context) => MainView(),
                              ),
                            );
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
