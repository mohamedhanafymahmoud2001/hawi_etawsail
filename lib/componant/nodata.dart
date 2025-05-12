import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';

class NoData extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundColor: colorsApp.colorgreen2.withOpacity(0.1),
              ),
              Container(
                  height: 136, child: Image.asset("assets/images/nodata.png")),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              textAlign: TextAlign.center,
              "لا يوجد بيانات",
              style: TextStyle(
                  fontFamily: "Cairo",
                  color: colorsApp.colorgreen2,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
