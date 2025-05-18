import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/custom_button.dart';
import '../../constant.dart';
import '../../constant.dart' as val;
import 'widgets/onboarding_view2.dart';

class OnboardingView1 extends StatelessWidget {
  const OnboardingView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().colorgreen1,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("boarding5");
                      },
                      child: Container(
                        width: 64,
                        height: 24,
                        decoration: BoxDecoration(
                          color: ColorsApp().colorgreen2,
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Center(
                          child: Text(
                            "${langLocal.langLocal['skip']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(
                              color: ColorsApp().colorbody,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    Assets.imagesOnboardingBackground1,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    Assets.imagesOnboarding1,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
              "${langLocal.langLocal['onBoardingTitle1']!['${val.languagebox.get("language")}']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorsApp().colorbody,
                fontSize: 32,
              )),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42.0),
            child: Text(
                "${langLocal.langLocal['onBoarding1']!['${val.languagebox.get("language")}']}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorsApp().colorbody,
                  fontSize: 22,
                )),
          ),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: ColorsApp().colorgreen2,
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  Container(
                    width: 24,
                    height: 6,
                    decoration: BoxDecoration(
                      color: ColorsApp().colorbody,
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
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
                ]),
                OnboardingButton(
                  backgroundColor: ColorsApp().colorbody,
                  titleColor: ColorsApp().colorgreen1,
                  onPressed: () {
                    Navigator.of(context).pushNamed("boarding2");
                  },
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
  }
}
