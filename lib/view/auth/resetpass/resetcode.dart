import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/appBarApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/constant.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/auth/pincode.dart';
import 'package:provider/provider.dart';

class ResetCode extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ResetCode();
  }
}

class _ResetCode extends State<ResetCode> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBack(),
        body: Consumer<Control>(builder: (context, val, child) {
          return Directionality(
            textDirection: val.direction,
            child: Container(
              width: double.infinity,
              child: Form(
                key: formstate,
                child: Column(
                  children: [
                    Expanded(child: SizedBox()),
                    Text(
                      textAlign: TextAlign.center,
                      "${langLocal.langLocal['resetPasswordTitle']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      textAlign: TextAlign.center,
                      "${langLocal.langLocal['confirmationSent2']!['${val.languagebox.get("language")}']} ${val.api.resetPhone.text}",
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: 330,
                      child: PinInputStyles.buildPinInput(
                        onCompleted: (pin) {
                          //  print("User entered PIN: $pin");
                        },
                      ),

                      //  Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         child: InputCode(
                      //           hint: "*",
                      //           controler: val.api.code1,
                      //           keyboard: TextInputType.number,
                      //           type: "start",
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //         child: Container(
                      //       child: InputCode(
                      //         hint: "*",
                      //         controler: val.api.code2,
                      //         keyboard: TextInputType.number,
                      //         type: "center",
                      //       ),
                      //     )),
                      //     Expanded(
                      //       child: Container(
                      //         child: InputCode(
                      //           hint: "*",
                      //           controler: val.api.code3,
                      //           keyboard: TextInputType.number,
                      //           type: "center",
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //         child: Container(
                      //       child: InputCode(
                      //         hint: "*",
                      //         controler: val.api.code4,
                      //         keyboard: TextInputType.number,
                      //         type: "center",
                      //       ),
                      //     )),
                      //     Expanded(
                      //         child: Container(
                      //       child: InputCode(
                      //         hint: "*",
                      //         controler: val.api.code5,
                      //         keyboard: TextInputType.number,
                      //         type: "center",
                      //       ),
                      //     )),
                      //     Expanded(
                      //         child: Container(
                      //       child: InputCode(
                      //         hint: "*",
                      //         controler: val.api.code6,
                      //         keyboard: TextInputType.number,
                      //         type: "end",
                      //       ),
                      //     )),
                      //   ],
                      // ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        val.ResendCodeRest();
                        dialogApp.checkdialog(
                          context,
                          () {
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      child: Text(
                        "${langLocal.langLocal['resendCode']!['${val.languagebox.get("language")}']}",
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.blue),
                      ),
                    ),
                    Expanded(flex: 3, child: SizedBox()),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: ButtonApp(
                          title:
                              "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                          func: () {
                            if (formstate.currentState!.validate()) {
                              val.ResetCode();
                              dialogApp.checkdialog(
                                context,
                                () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pushNamed("newpass");
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
            ),
          );
        }));
  }
}
