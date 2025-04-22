import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/componant/orderdesgin.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class MyOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyOrders();
  }
}

class _MyOrders extends State<MyOrders> {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<Control>(builder: (context, val, child) {
      return Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 25),
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
                                Navigator.of(context).pop();
                              },
                              icon: Icon(Icons.keyboard_arrow_left)),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            child: Text(
                              textAlign: TextAlign.center,

                                "${langLocal.langLocal['my_orders']!['${val.languagebox.get("language")}']}",
                              style: TextStyle(
                                  fontFamily: "Cairo",
                                  color: colorsApp.colorbody,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
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
              Container(
                padding: EdgeInsets.all(3),
                width: 286,
                height: 56,
                decoration: BoxDecoration(
                    color: colorsApp.colorgreen1,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  children: [
                    Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                          color: val.ordertype == "recive"
                              ? colorsApp.colorgreen2
                              : colorsApp.colorgreen1,
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        onPressed: () {
                          val.SwitchOrderType("recive");
                          val.OrderReciver();
                        },
                        child: Text(
                          "${langLocal.langLocal['receivedOrders']!['${val.languagebox.get("language")}']}",

                          style: TextStyle(
                              fontFamily: "Cairo", color: colorsApp.colorbody),
                        ),
                      ),
                    ),
                    Container(
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                          color: val.ordertype == "send"
                              ? colorsApp.colorgreen2
                              : colorsApp.colorgreen1,
                          borderRadius: BorderRadius.circular(50)),
                      child: MaterialButton(
                        onPressed: () {
                          val.OrderSender();
                          val.SwitchOrderType("send");
                        },
                        child: Text(
                          "${langLocal.langLocal['sentOrders']!['${val.languagebox.get("language")}']}",

                          style: TextStyle(
                              fontFamily: "Cairo", color: colorsApp.colorbody),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Expanded(child: NoData(),)
          val.orders == null
              ? Container(
                  height: 600,
                  child: Center(child: CircularProgressIndicator()))
              : val.orders['status'] == false ||
                      (val.orders['data'] as List).isEmpty
                  ? Container(height: 600, child: Center(child: NoData()))
                  : Expanded(
                      child: Container(
                      child: ListView.builder(
                          itemCount: val.orders['data'].length,
                          itemBuilder: (context, i) {
                            return OrderDesign(
                              data: val.orders['data'][i],
                            );
                          }),
                    ))
        ],
      );
    }));
  }
}
