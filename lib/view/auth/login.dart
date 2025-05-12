import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/appBarApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Form(
          key: formstate,
          child: Column(
            children: [
              Text(
                "${langLocal.langLocal['introText']!['${val.languagebox.get("language")}']}",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              InputApp(
                  hint:
                      "${langLocal.langLocal['phone']!['${val.languagebox.get("language")}']}",
                  controler: val.api.phoneSignin,
                  icon: Icon(
                    Icons.phone_outlined,
                    color: colorsApp.colorborder,
                  ),
                  keyboard: TextInputType.phone),
              InputAppPass(
                  hint: //${langLocal.langLocal['pass']['${val.languagebox.get("language")}']}
                      "${langLocal.langLocal['password']!['${val.languagebox.get("language")}']}",
                  show: val.passshow3,
                  controler: val.api.passSignin,
                  icon: IconButton(
                      onPressed: () {
                        val.PassShow3();
                      },
                      icon: Icon(
                        val.passshow3 == true
                            ? Icons.visibility_off_outlined
                            : Icons.visibility,
                        color: colorsApp.colorborder,
                      )),
                  keyboard: TextInputType.visiblePassword),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("resetphone");
                },
                child: Text(
                  "${langLocal.langLocal['forgotPassword']!['${val.languagebox.get("language")}']}",
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.blue),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: ButtonApp(
                    title:
                        "${langLocal.langLocal['login']!['${val.languagebox.get("language")}']}",
                    func: () {
                      if (formstate.currentState!.validate()) {
                        val.loginUser();
                        dialogApp.checkdialog(
                          context,
                          () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed("mainview");
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
    });
  }
}
