import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/appBarApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/auth/login.dart';
import 'package:hawy_altawsil/view/auth/register.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Auth();
  }
}

class _Auth extends State<Auth> {
  ColorsApp colorsApp = new ColorsApp();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).GetTokenDevice();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAuth(),
      body: Consumer<Control>(builder: (context, val, child) {
        return Container(
          // width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              child: Image.asset("assets/images/login1.png")),
                          Expanded(child: SizedBox()),
                          Expanded(
                              child: Image.asset("assets/images/login2.png"))
                        ],
                      ),
                    ),
                    Container(
                      width: 260,
                      height: 50,
                      decoration: BoxDecoration(
                          color: colorsApp.colorblackApp,
                          borderRadius: BorderRadius.circular(50)),
                      child: Row(
                        children: [
                          Container(
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                                color: val.auth == "login"
                                    ? colorsApp.colorgreen2
                                    : colorsApp.colorblackApp,
                                borderRadius: BorderRadius.circular(50)),
                            child: MaterialButton(
                              onPressed: () {
                                val.SwitchAuth("login");
                              },
                              child: Text(
                                "تسجيل الدخول ",
                                style: TextStyle(color: colorsApp.colorbody),
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 50,
                            decoration: BoxDecoration(
                                color: val.auth == "register"
                                    ? colorsApp.colorgreen2
                                    : colorsApp.colorblackApp,
                                borderRadius: BorderRadius.circular(50)),
                            child: MaterialButton(
                              onPressed: () {
                                val.SwitchAuth("register");
                              },
                              child: Text(
                                "انشاء حساب",
                                style: TextStyle(color: colorsApp.colorbody),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: val.auth == "login" ? Login() : Register()),
              ],
            ),
          ),
        );
      }),
    );
  }
}
