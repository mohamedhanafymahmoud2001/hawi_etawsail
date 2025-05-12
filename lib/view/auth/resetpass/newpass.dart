import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/appBarApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/auth/auth.dart';
import 'package:provider/provider.dart';

class NewPass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewPass();
  }
}

class _NewPass extends State<NewPass> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack(),
        body: Consumer<Control>(builder: (context, val, child) {
          return Container(
            width: double.infinity,
            child: Form(
              key: formstate,
              child: Column(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    textAlign: TextAlign.center,
                    "إعادة تعيين كلمة المرور",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    textAlign: TextAlign.center,
                    "قم بإدخال كلمة المرور الجديدة",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputAppPass(
                      hint: //${langLocal.langLocal['pass']['${val.languagebox.get("language")}']}
                          "password",
                      show: val.passshow1,
                      controler: val.api.newPass,
                      icon: IconButton(
                          onPressed: () {
                            val.PassShow1();
                          },
                          icon: Icon(
                            val.passshow1 == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: colorsApp.colorborder,
                          )),
                      keyboard: TextInputType.visiblePassword),
                  InputAppPass(
                      hint: //${langLocal.langLocal['pass']['${val.languagebox.get("language")}']}
                          "confirm password",
                      show: val.passshow2,
                      controler: val.api.confirmNewPass,
                      icon: IconButton(
                          onPressed: () {
                            val.PassShow2();
                          },
                          icon: Icon(
                            val.passshow2 == true
                                ? Icons.visibility_off_outlined
                                : Icons.visibility,
                            color: colorsApp.colorborder,
                          )),
                      keyboard: TextInputType.visiblePassword),
                  Expanded(flex: 3, child: SizedBox()),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ButtonApp(
                        title: "موافق",
                        func: () {
                          if (formstate.currentState!.validate()) {
                            val.NewPass();
                            dialogApp.checkdialog(
                              context,
                              () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => Auth()),
                                  (Route<dynamic> route) => false,
                                );
                              },
                            ); //
                            print("validat");
                          } else {
                            print("not validat");
                          }
                        }),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
