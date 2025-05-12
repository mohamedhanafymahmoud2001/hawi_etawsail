import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/onboarding_view4.dart';
import 'package:hive/hive.dart';

import 'package:provider/provider.dart';

import '../../../componant/app_text_style.dart';
import '../../../prov/prov.dart';
import '../../main/main_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  ColorsApp colorsApp = ColorsApp();

  late Box tokenbox = Hive.box("token");
  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).initLang();
    });
    executeNavigation();
    super.initState();
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              tokenbox.get("token") == null || tokenbox.get("token") == ""
                  ? OnboardingView4()
                  : MainView(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "هاوي توصيل",
        style: AppTextStyles.style32W400(context).copyWith(
          color: colorsApp.colorbody,
          fontFamily: "VEXA",
        ),
      ),
    );
  }
}
