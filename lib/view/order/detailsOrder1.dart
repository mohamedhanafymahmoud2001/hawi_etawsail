import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/bottomSheetApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class DetailsOrder1 extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
  BottomSheetApp bottomSheetApp = new BottomSheetApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return SingleChildScrollView(
        child: Form(
          key: formstate,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "${langLocal.langLocal['recipient_details']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        color: colorsApp.colorgreen2,
                        fontSize: 18,
                        fontFamily: "Cairo"),
                  )),
              InputAppOrder(
                hint:
                    "${langLocal.langLocal['enter_recipient_name']!['${val.languagebox.get("language")}']}",
                controler: val.api.nameRe,
                keyboard: TextInputType.text,
                line: 1,
              ),
              InputAppOrder(
                hint:
                    "${langLocal.langLocal['enter_recipient_phone']!['${val.languagebox.get("language")}']}",
                controler: val.api.phoneRe,
                keyboard: TextInputType.phone,
                line: 1,
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "${langLocal.langLocal['enter_order_details']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        color: colorsApp.colorgreen2,
                        fontSize: 18,
                        fontFamily: "Cairo"),
                  )),
              InputAppOrder(
                hint:
                    "${langLocal.langLocal['enter_product_name']!['${val.languagebox.get("language")}']}",
                controler: val.api.namePr,
                keyboard: TextInputType.text,
                line: 1,
              ),
              InputAppOrder(
                hint:
                    "${langLocal.langLocal['enter_product_description']!['${val.languagebox.get("language")}']}",
                controler: val.api.decPr,
                keyboard: TextInputType.text,
                line: 4,
              ),
              MaterialButton(
                onPressed: () {
                  // val.uploadImageProdect();
                  bottomSheetApp.showPickerOptions(context);
                },
                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10),
                  dashPattern: [6, 3], // طول الخط والمسافة بين الخطوط
                  color: colorsApp.colorborder,
                  strokeWidth: 2,
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    child: Column(
                      children: [
                        val.imageFileProdect == null
                            ? Container(
                                margin: EdgeInsets.only(top: 30),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset("assets/images/image1.png"),
                                    Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Image.asset(
                                            "assets/images/image2.png")),
                                  ],
                                ),
                              )
                            : Container(
                                height: 150,
                                child: Image.file(val.imageFileProdect!),
                              ),
                        Expanded(child: Container()),
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text(
                            "${langLocal.langLocal['upload_product_image']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "${langLocal.langLocal['select_package_weight']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        color: colorsApp.colorgreen2,
                        fontSize: 18,
                        fontFamily: "Cairo"),
                  )),
              InputAppWhait(
                  hint: "00.00 KG",
                  controler: val.api.whait,
                  keyboard: TextInputType.number),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "${langLocal.langLocal['package_wrapping']!['${val.languagebox.get("language")}']}",
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
                      val.choseTypeCover("cover");
                    },
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, right: 15, left: 30),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: val.typeCover == "cover" ? 1 : 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${langLocal.langLocal['packaged']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: val.typeCover == "cover" ? 1 : 0.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width:
                                          val.typeCover == "cover" ? 1 : 0.3),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 30,),
                  MaterialButton(
                    onPressed: () {
                      val.choseTypeCover("unCover");
                    },
                    child: Container(
                      width: 130,
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, right: 5, left: 0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: val.typeCover == "unCover" ? 1 : 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${langLocal.langLocal['notPackaged']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width:
                                        val.typeCover == "unCover" ? 1 : 0.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width:
                                          val.typeCover == "unCover" ? 1 : 0.3),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "${langLocal.langLocal['fragility']!['${val.languagebox.get("language")}']}",
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
                      val.choseTypeBreak("break");
                    },
                    child: Container(
                      width: 135,
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, right: 15, left: 30),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: val.typeBreak == "break" ? 1 : 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${langLocal.langLocal['fragile']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: val.typeBreak == "break" ? 1 : 0.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width:
                                          val.typeBreak == "break" ? 1 : 0.3),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 30,),
                  MaterialButton(
                    onPressed: () {
                      val.choseTypeBreak("notBreak");
                    },
                    child: Container(
                      width: 135,
                      padding: EdgeInsets.only(
                          top: 15, bottom: 15, right: 15, left: 0),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: val.typeBreak == "notBreak" ? 1 : 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${langLocal.langLocal['notFragile']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(fontSize: 14, fontFamily: "Cairo"),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width:
                                        val.typeBreak == "notBreak" ? 1 : 0.3),
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              padding: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: val.typeBreak == "notBreak"
                                          ? 1
                                          : 0.3),
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ButtonApp(
                  title:
                      "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                  func: () {
                    if (formstate.currentState!.validate() &&
                        val.typeCover != "" &&
                        val.typeBreak != "" &&
                        val.imageFileProdect != null) {
                      val.SwitchOrderScreen("detailsorder2");
                    } else {
                      print("not validat");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "${langLocal.langLocal['complete_information']!['${val.languagebox.get("language")}']}",
                          ),
                          duration: Duration(seconds: 3), // تختفي بعد 3 ثوانٍ
                        ),
                      );
                    }
                  })
            ],
          ),
        ),
      );
    });
  }
}
