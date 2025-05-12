import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(":وصف المنتج "),
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
                    textAlign: TextAlign.end,
                    val.typeCover == "cover" ? "مغلف" : "غير مغلف",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(":التغليف "),
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
                    textAlign: TextAlign.end,
                    val.typeBreak == "break" ? "حساس" : "غير حساس",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text("حساسية الكسر"),
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
                    textAlign: TextAlign.end,
                    "كجم ${val.api.whait.text} ",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(":وزن الطرد "),
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
                    textAlign: TextAlign.end,
                    "${val.api.nameRe.text}",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(":اسم المستلم "),
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
                    textAlign: TextAlign.end,
                    "${val.api.phoneRe.text}",
                    style: TextStyle(fontSize: 11, fontFamily: "Cairo"),
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(":رقم هاتف المستلم "),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(30),
                child: ButtonApp(
                    title: "اتمام الطلب",
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
