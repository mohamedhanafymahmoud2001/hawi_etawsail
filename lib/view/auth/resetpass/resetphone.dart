import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/appBarApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

class ResetPhone extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResetPhone();
  }
}

class _ResetPhone extends State<ResetPhone> {
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
                    "قم بإدخال رقم المحمول ",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Cairo",
                        fontWeight: FontWeight.bold),
                  ),
                  
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: InputApp(
                        hint: "phone",
                        controler: val.api.resetPhone,
                        icon: Icon(
                          Icons.phone_outlined,
                          color: colorsApp.colorborder,
                        ),
                        keyboard: TextInputType.phone),
                  ),
                  
                  Expanded(flex: 3, child: SizedBox()),
                  Container(
                    margin: EdgeInsets.all(20),
                    child: ButtonApp(
                        title: "التالي",
                        func: () {
                          if (formstate.currentState!.validate()) {
                            val.ResetPhone();
                            dialogApp.checkdialog(
                              context,
                              () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pushNamed("resetcode");
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
