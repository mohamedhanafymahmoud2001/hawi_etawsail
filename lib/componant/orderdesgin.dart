import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:provider/provider.dart';

class OrderDesign extends StatelessWidget {
  OrderDesign({super.key, required this.data});
  final Map data;
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return MaterialButton(
        onPressed: () {
          Navigator.of(context).pushNamed("details");
          val.ShowOrder(data['id']);
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 0.3),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsApp().colorgreen1,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        Assets.imagesBox2,
                        width: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      textAlign: TextAlign.center,
                      "ID : ${data['orderNumber']}",
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: colorsApp.colorblackApp,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      textAlign: TextAlign.center,
                      data["status"] == "create"
                          ? "انشاء الطلب"
                          : data["status"] == "bookOrder"
                              ? "تم الحجز"
                              : data["status"] == "receiveOrder"
                                  ? "تم الاستلام"
                                  : data["status"] == "back"
                                      ? "رجوع"
                                      : data["status"] == "finishedBack"
                                          ? "تم الارجاع"
                                          : data["status"] == "cancelled"
                                              ? "تم الالغاء"
                                              : "تم توصيلها",
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: data["status"] == "create"
                              ? const Color.fromARGB(255, 187, 173, 45)
                              : data["status"] == "bookOrder"
                                  ? Colors.blue
                                  : data["status"] == "receiveOrder"
                                      ? Colors.blue
                                      : data["status"] == "back"
                                          ? const Color.fromARGB(
                                              255, 173, 51, 43)
                                          : data["status"] == "finishedBack"
                                              ? const Color.fromARGB(
                                                  255, 143, 108, 4)
                                              : data["status"] == "cancelled"
                                                  ? Colors.red
                                                  : colorsApp.colorgreen1,
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        "${data['city_sender']}",
                        style: TextStyle(
                            fontFamily: "Cairo",
                            color: colorsApp.colorgreen1,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: Icon(Icons.arrow_forward),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        textAlign: TextAlign.center,
                        "${data['city_receiver']}",
                        style: TextStyle(
                            fontFamily: "Cairo",
                            color: colorsApp.colorgreen1,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
