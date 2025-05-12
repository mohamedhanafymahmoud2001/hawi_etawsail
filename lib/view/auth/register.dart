import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/appBarApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class Register extends StatelessWidget {
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
              Row(
                children: [
                  Expanded(
                      child: Container(
                    child: InputApp(
                        hint:
                            "${langLocal.langLocal['firstName']!['${val.languagebox.get("language")}']}",
                        controler: val.api.fname,
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: colorsApp.colorborder,
                        ),
                        keyboard: TextInputType.text),
                  )),
                  Expanded(
                      child: Container(
                    child: InputApp(
                        hint:
                            "${langLocal.langLocal['lastName']!['${val.languagebox.get("language")}']}",
                        controler: val.api.lname,
                        icon: Icon(
                          Icons.person_2_outlined,
                          color: colorsApp.colorborder,
                        ),
                        keyboard: TextInputType.text),
                  )),
                ],
              ),
              InputApp(
                  hint:
                      "${langLocal.langLocal['phone']!['${val.languagebox.get("language")}']}",
                  controler: val.api.phone,
                  icon: Icon(
                    Icons.phone_outlined,
                    color: colorsApp.colorborder,
                  ),
                  keyboard: TextInputType.phone),
              InputAppPass(
                  hint:
                      "${langLocal.langLocal['password']!['${val.languagebox.get("language")}']}",
                  show: val.passshow1,
                  controler: val.api.password,
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
                      "${langLocal.langLocal['confirmPassword']!['${val.languagebox.get("language")}']}",
                  show: val.passshow2,
                  controler: val.api.confirmPassword,
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
              Container(
                margin: EdgeInsets.all(20),
                child: ButtonApp(
                    title:
                        "${langLocal.langLocal['createAccount']!['${val.languagebox.get("language")}']}",
                    func: () {
                      if (formstate.currentState!.validate()) {
                        val.RegisterUser();
                        dialogApp.checkdialog(
                          context,
                          () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed("code");
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
