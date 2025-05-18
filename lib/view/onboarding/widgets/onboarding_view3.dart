import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/custom_button.dart';

import '../../../constant.dart';
import '../../../constant.dart' as val;

class OnboardingView3 extends StatelessWidget {
  const OnboardingView3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp().colorgreen2,
      body: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ColorsApp().colorbody,
                        border:
                            Border.all(width: 1, color: Colors.grey.shade200),
                      ),
                      child: const Center(
                        child: Icon(Icons.arrow_back_ios_new, size: 16),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed("boarding5"),
                    child: Container(
                      width: 64,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.orange,
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
                    ),
                  ),
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
                  height: MediaQuery.of(context).size.height / 2,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          Assets.imagesImagesOnboardingBackground3,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 300,
                  child: Image.asset(Assets.imagesOnboarding3),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text(
            "${langLocal.langLocal['onBoardingTitle3']!['${val.languagebox.get("language")}']}",
            textAlign: TextAlign.center,
            style: TextStyle(color: ColorsApp().colorbody, fontSize: 32),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "${langLocal.langLocal['onBoarding3']!['${val.languagebox.get("language")}']}",
              textAlign: TextAlign.center,
              style: TextStyle(color: ColorsApp().colorbody, fontSize: 22),
            ),
          ),
          // const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Container(
                        width: index == 3 ? 24 : 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: index == 3
                              ? ColorsApp().colorbody
                              : ColorsApp().colorgreen1,
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                    );
                  }),
                ),
                OnboardingButton(
                  backgroundColor: ColorsApp().colorbody,
                  titleColor: ColorsApp().colorgreen1,
                  onPressed: () => Navigator.of(context).pushNamed("boarding5"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
