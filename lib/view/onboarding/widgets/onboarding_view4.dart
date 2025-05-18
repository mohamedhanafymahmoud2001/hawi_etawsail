import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class OnboardingView4 extends StatelessWidget {
  const OnboardingView4({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        backgroundColor: ColorsApp().colorbody,
        body: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      Assets.imagesOnboardingBackground2,
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Image.asset(
                      Assets.imagesOnboarding4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Text("حدد اللغة المناسبة لك",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 32,
                )),
            const SizedBox(
              height: 16,
            ),
            MaterialButton(
              elevation: 0,
              onPressed: () {
                val.choseLangouge("ar");
              },
              color: ColorsApp().colorbody,
              minWidth: 260,
              height: 48,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: val.lang == "ar"
                      ? BorderSide(color: Colors.black)
                      : BorderSide(color: Colors.grey.shade200)),
              child: Text(
                "اللغة العربية",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            MaterialButton(
              elevation: 0,
              onPressed: () {
                val.choseLangouge("en");
              },
              color: ColorsApp().colorbody,
              minWidth: 260,
              height: 48,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
                side: val.lang == "en"
                    ? BorderSide(color: Colors.black)
                    : BorderSide(color: Colors.grey.shade200),
              ),
              child: Text(
                "English",
                style: TextStyle(fontSize: 16),
              ),
            ),
            // Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    Container(
                      width: 24,
                      height: 6,
                      decoration: BoxDecoration(
                        color: ColorsApp().colorgreen1,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: ColorsApp().colorgreen2,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: ColorsApp().colorgreen2,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: ColorsApp().colorgreen2,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: ColorsApp().colorgreen2,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                  ]),
                  MaterialButton(
                    onPressed: () {
                      if (val.lang != "") {
                        Navigator.of(context).pushNamed("boarding1");
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("اختر اللغة"),
                            duration: Duration(seconds: 1), // تختفي بعد 3 ثوانٍ
                          ),
                        );
                      }
                    },
                    color: ColorsApp().colorgreen1,
                    minWidth: 64,
                    height: 64,
                    shape: const StadiumBorder(),
                    child: Text(
                      "التالي",
                      style: TextStyle(
                        color: ColorsApp().colorbody,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            )
          ],
        ),
      );
    });
  }
}
