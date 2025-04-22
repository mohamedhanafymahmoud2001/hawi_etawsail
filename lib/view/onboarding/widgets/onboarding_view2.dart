import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/custom_button.dart';
import '../../../constant.dart';
import '../../../constant.dart' as val;
import 'onboarding_view3.dart';

class OnboardingView2 extends StatelessWidget {
  const OnboardingView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().colorbody,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 1, color: Colors.grey.shade200),
                    ),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          size: 16,
                        ),
                      ),
                    ),
                  ),
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
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Assets.imagesOnboardingBackground2,
                ),
              ),
              SizedBox(
                width: 300,
                child: Image.asset(Assets.imagesOnboarding2),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
              "${langLocal.langLocal['onboarding2']!['${val.languagebox.get("language")}']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32,
              )),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
                "${langLocal.langLocal['onboarding2']!['${val.languagebox.get("language")}']}",  textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                )),
          ),
          Spacer(),
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
                ]),
                OnboardingButton(
                  backgroundColor: ColorsApp().colorbody,
                  titleColor: ColorsApp().colorgreen1,
                  onPressed: () {
                    Navigator.of(context).pushNamed("boarding3");
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
