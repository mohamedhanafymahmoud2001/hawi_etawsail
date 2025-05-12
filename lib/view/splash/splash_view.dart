import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/view/splash/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  ColorsApp colorsApp = ColorsApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsApp.colorgreen1,
      body: SplashViewBody(),
    );
  }
}
