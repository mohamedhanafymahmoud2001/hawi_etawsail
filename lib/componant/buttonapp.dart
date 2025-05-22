import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';

class ButtonApp extends StatelessWidget {
  ButtonApp({super.key, required this.title, required this.func});
  final String title;
  final VoidCallback func;
  ColorsApp colorApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // padding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
      onTap: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: colorApp.colorblackApp,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "$title",
          style:
              TextStyle(color: colorApp.colorbody, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class ButtonOrder extends StatelessWidget {
  ButtonOrder({super.key, required this.title, required this.func});
  final String title;
  final VoidCallback func;
  ColorsApp colorApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      onPressed: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 251, 136, 0),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          "$title",
          style: TextStyle(color: colorApp.colorbody, fontSize: 12),
        ),
      ),
    );
  }
}
