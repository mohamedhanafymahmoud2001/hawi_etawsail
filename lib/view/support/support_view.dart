import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class SupportView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SupportView();
  }
}

class _SupportView extends State<SupportView> {
  GlobalKey<FormState> formstate = GlobalKey();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: val.direction,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: formstate,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Image.asset(Assets.imagesSupportView),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: val.api.orderNumber,
                    maxLines: 1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "${langLocal.langLocal['requiredField']!['${val.languagebox.get("language")}']}";
                      }
                    },
                    decoration: InputDecoration(
                      labelText:
                          "${langLocal.langLocal['enter_order_number']!['${val.languagebox.get("language")}']}",
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      hintStyle: const TextStyle(fontSize: 16),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: val.api.message,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "${langLocal.langLocal['requiredField']!['${val.languagebox.get("language")}']}";
                        ;
                      }
                    },
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText:
                          "${langLocal.langLocal['send_complaint_text']!['${val.languagebox.get("language")}']}",
                      labelStyle: TextStyle(color: Colors.grey[700]),
                      hintStyle: const TextStyle(fontSize: 16),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  MaterialButton(
                    onPressed: () {
                      if (formstate.currentState!.validate()) {
                        val.Support();
                        dialogApp.checkdialog(context, () {
                          Navigator.of(context).pop();
                        });
                      } else {
                        print("not validat");
                      }
                    },
                    minWidth: 100,
                    height: 45,
                    color: ColorsApp().colorblackApp,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      "${langLocal.langLocal['send_complaint']!['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: ColorsApp().colorbody),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
