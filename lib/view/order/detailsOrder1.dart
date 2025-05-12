import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

class DetailsOrder1 extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  GlobalKey<FormState> formstate = GlobalKey();
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
                    "أدخل بيانات المستلم",
                    style: TextStyle(
                        color: colorsApp.colorgreen2,
                        fontSize: 18,
                        fontFamily: "Cairo"),
                  )),
              InputAppOrder(
                hint: "أدخل إسم المستلم ",
                controler: val.api.nameRe,
                keyboard: TextInputType.text,
                line: 1,
              ),
              InputAppOrder(
                hint: "أدخل رقم هاتف المستلم ",
                controler: val.api.phoneRe,
                keyboard: TextInputType.phone,
                line: 1,
              ),
              Container(
                  margin: EdgeInsets.all(20),
                  child: Text(
                    "أدخل بيانات طلبك",
                    style: TextStyle(
                        color: colorsApp.colorgreen2,
                        fontSize: 18,
                        fontFamily: "Cairo"),
                  )),
              InputAppOrder(
                hint: "أدخل إسم المنتج",
                controler: val.api.namePr,
                keyboard: TextInputType.text,
                line: 1,
              ),
              InputAppOrder(
                hint: "أدخل وصف المنتج",
                controler: val.api.decPr,
                keyboard: TextInputType.text,
                line: 4,
              ),
              MaterialButton(
                onPressed: () {
                  val.uploadImageProdect();
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
                            "أدخل صورة للمنتج",
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
                    "حدد وزن الطرد",
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
                    "تغليف الطرد",
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
                            "مغلف",
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
                          top: 15, bottom: 15, right: 15, left: 30),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: val.typeCover == "unCover" ? 1 : 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "غير مغلف",
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
                    "حساسية الكسر",
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
                            "حساس",
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
                          top: 15, bottom: 15, right: 15, left: 30),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: val.typeBreak == "notBreak" ? 1 : 0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "غير حساس",
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
                  title: "التالي",
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
                          content: Text("اكمل البيانات"),
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
