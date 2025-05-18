import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

class InputApp extends StatelessWidget {
  InputApp({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }
              return null;
            },
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                prefixIcon: icon,
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: colorsApp.colorborder),
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      );
    });
  }
}

class InputAppPass extends StatelessWidget {
  InputAppPass({
    super.key,
    required this.hint,
    required this.show,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final bool show;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }
              return null;
            },
            obscureText: show,
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                prefixIcon: icon,
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      );
    });
  }
}

class InputCode extends StatelessWidget {
  InputCode({
    super.key,
    required this.hint,
    required this.controler,
    required this.keyboard,
    required this.type,
  });
  final TextEditingController controler;
  final String hint;
  final TextInputType keyboard;
  final String type;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 3),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }

              return null;
            },
            onChanged: (value) {
              if (type == "start") {
                if (value.length >= 1) {
                  FocusScope.of(context).nextFocus();
                }
              } else if (type == "center") {
                if (value.length >= 1) {
                  FocusScope.of(context).nextFocus();
                }
                if (value.length < 1) {
                  FocusScope.of(context).previousFocus();
                }
              } else {
                if (value.length < 1) {
                  FocusScope.of(context).previousFocus();
                }
              }
            },
            maxLength: 1,
            showCursor: false,
            textAlign: TextAlign.center,
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                counterText: '',
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      );
    });
  }
}

class InputLocation extends StatelessWidget {
  InputLocation({
    super.key,
    required this.suf,
    required this.controler,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String suf;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }
              return null;
            },
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                // hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                label: Container(
                    margin: EdgeInsets.only(right: 5),
                    width: 100,
                    alignment: Alignment.centerRight,
                    child: Text("$suf", style: TextStyle(fontFamily: "Cairo"))),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: colorsApp.colorborder),
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      );
    });
  }
}

class InputAppSearch extends StatelessWidget {
  InputAppSearch({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }
              return null;
            },
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                prefixIcon: icon,
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorsApp.colorborder, width: 0.3),
                    borderRadius: BorderRadius.circular(50))),
          ),
        ),
      );
    });
  }
}

class InputAppOrder extends StatelessWidget {
  InputAppOrder({
    super.key,
    required this.hint,
    required this.line,
    required this.controler,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final int line;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            maxLines: line,
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }
              return null;
            },
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorsApp.colorborder, width: 0.3),
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      );
    });
  }
}

class InputAppWhait extends StatelessWidget {
  InputAppWhait({
    super.key,
    required this.hint,
    required this.controler,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            textAlign: TextAlign.center,
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }
              return null;
            },
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      val.decreesWhiet();
                    },
                    icon: Icon(Icons.minimize, color: Colors.red)),
                prefixIcon: IconButton(
                    onPressed: () {
                      val.increesWhiet();
                    },
                    icon: Icon(
                      Icons.add,
                      color: colorsApp.colorgreen1,
                    )),
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorsApp.colorborder, width: 0.3),
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      );
    });
  }
}

class InputAppRwchargeWallet extends StatelessWidget {
  InputAppRwchargeWallet({
    super.key,
    required this.hint,
    required this.controler,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final TextInputType keyboard;

  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            textAlign: TextAlign.center,
            validator: (value) {
              if (value!.isEmpty) {
                return val.languagebox.get("language") == "en"
                    ? "empty"
                    : "فارغ";
              }
              return null;
            },
            keyboardType: keyboard,
            controller: controler,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      val.decreesRechargeWallet();
                    },
                    icon: Icon(Icons.minimize, color: Colors.red)),
                prefixIcon: IconButton(
                    onPressed: () {
                      val.increesRechargeWallet();
                    },
                    icon: Icon(
                      Icons.add,
                      color: colorsApp.colorgreen1,
                    )),
                hintText: hint,
                hintStyle:
                    TextStyle(fontSize: 12, color: colorsApp.colorborder),
                border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorsApp.colorborder, width: 0.3),
                    borderRadius: BorderRadius.circular(70))),
          ),
        ),
      );
    });
  }
}
