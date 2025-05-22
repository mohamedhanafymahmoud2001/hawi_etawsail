import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class DetailsOrder2 extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "${val.api.namePr.text}",
                  style: TextStyle(
                      color: colorsApp.colorgreen2,
                      fontSize: 18,
                      fontFamily: "Cairo"),
                )),
            Container(
              margin: EdgeInsets.all(20),
              child: Image.file(val.imageFileProdect!),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: colorsApp.colorborder.withOpacity(0.4),
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${langLocal.langLocal['productDescription']!['${val.languagebox.get("language")}']}",
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    "${val.api.decPr.text}",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: colorsApp.colorbody,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${langLocal.langLocal['packaging']!['${val.languagebox.get("language")}']}",
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    val.typeCover == "cover"
                        ? "${langLocal.langLocal['packaged']!['${val.languagebox.get("language")}']}"
                        : "${langLocal.langLocal['notPackaged']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: colorsApp.colorborder.withOpacity(0.4),
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${langLocal.langLocal['fragility']!['${val.languagebox.get("language")}']}",
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    val.typeBreak == "break"
                        ? "${langLocal.langLocal['fragile']!['${val.languagebox.get("language")}']}"
                        : "${langLocal.langLocal['notFragile']!['${val.languagebox.get("language")}']}",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: colorsApp.colorbody,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${langLocal.langLocal['packageWeight']!['${val.languagebox.get("language")}']}",
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    "كجم ${val.api.whait.text} ",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: colorsApp.colorborder.withOpacity(0.4),
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${langLocal.langLocal['recipientName']!['${val.languagebox.get("language")}']}",
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    "${val.api.nameRe.text}",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              color: colorsApp.colorbody,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${langLocal.langLocal['recipientPhone']!['${val.languagebox.get("language")}']}",
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    textAlign: TextAlign.end,
                    "${val.api.phoneRe.text}",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(30),
                child: ButtonApp(
                    title:
                        "${langLocal.langLocal['done']!['${val.languagebox.get("language")}']}",
                    func: () {
                      val.Order();
                      dialogApp.checkdialog(context, () {
                        Navigator.of(context).pop();
                        val.SwitchOrderScreen("chosepayment");
                      });
                    }))
          ],
        ),
      );
    });
  }
}
