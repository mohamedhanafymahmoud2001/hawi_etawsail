import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  ColorsApp colorApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return AppBar(
        leading: Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: colorApp.colorborder, width: 1)),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.keyboard_arrow_left)),
        ),
        actions: [
          Container(
              // height: 60,
              width: 100,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ))
        ],
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class AppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  ColorsApp colorApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return AppBar(
        // leading: Container(
        //   margin: EdgeInsets.all(5),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(50),
        //       border: Border.all(color: colorApp.colorborder, width: 1)),
        //   child: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //       icon: Icon(Icons.keyboard_arrow_left)),
        // ),
        actions: [
          Container(
              // height: 60,
              width: 100,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.cover,
              ))
        ],
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
