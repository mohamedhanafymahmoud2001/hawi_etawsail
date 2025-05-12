import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/prov/langlocal.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class StepperOrder extends StatelessWidget {
  StepperOrder({
    super.key,
    required this.activeStep,
    required this.status,
  });

  final int activeStep;
  final String status;
  final ColorsApp colorsApp = ColorsApp();

  @override
  Widget build(BuildContext context) {
    LangLocal langLocal = new LangLocal();

    late Box languagebox = Hive.box("language");
    // إنشاء قائمة الخطوات بناءً على الحالة
    //create', 'bookOrder', 'receiveOrder', 'finished', 'back', 'finishedBack', 'cancelled'
    List<EasyStep> steps = [
      EasyStep(
        customStep: CircleAvatar(
          radius: 8,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: 7,
            backgroundColor:
                activeStep >= 0 ? colorsApp.colorgreen2 : colorsApp.colorborder,
          ),
        ),
        title:
            '${langLocal.langLocal['create']!['${languagebox.get("language")}']}',
      ),
      if (status == "cancelled")
        EasyStep(
          topTitle: true,
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: activeStep >= 0
                  ? colorsApp.colorgreen2
                  : colorsApp.colorborder,
            ),
          ),
          title:
              '${langLocal.langLocal['cancelled']!['${languagebox.get("language")}']}',
        ),
      if (status != "cancelled")
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: activeStep >= 1
                  ? colorsApp.colorgreen2
                  : colorsApp.colorborder,
            ),
          ),
          title:
              '${langLocal.langLocal['book']!['${languagebox.get("language")}']}',
          topTitle: true,
        ),
      if (status != "cancelled")
        EasyStep(
          customStep: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 7,
              backgroundColor: activeStep >= 2
                  ? colorsApp.colorgreen2
                  : colorsApp.colorborder,
            ),
          ),
          title:
              '${langLocal.langLocal['recive']!['${languagebox.get("language")}']}',
        ),
      if (status != "cancelled")
        if (status == 'back' ||
            status == "finishedBack") // إخفاء الخطوة عند عدم الحاجة لها
          EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor: activeStep >= 3
                    ? colorsApp.colorgreen2
                    : colorsApp.colorborder,
              ),
            ),
            title:
                '${langLocal.langLocal['back']!['${languagebox.get("language")}']}',
            topTitle: true,
          ),
      if (status != "cancelled")
        status == "finishedBack" || status == "back"
            ? EasyStep(
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= 4
                        ? colorsApp.colorgreen2
                        : colorsApp.colorborder,
                  ),
                ),
                title:
                    '${langLocal.langLocal['finishback']!['${languagebox.get("language")}']}',
              )
            : EasyStep(
                topTitle: true,
                customStep: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: activeStep >= 4
                        ? colorsApp.colorgreen2
                        : colorsApp.colorborder,
                  ),
                ),
                title:
                    '${langLocal.langLocal['finish']!['${languagebox.get("language")}']}',
              ),
    ];

    return Container(
      height: 90,
      child: EasyStepper(
        activeStep: activeStep,
        activeStepTextColor: Colors.black87,
        finishedStepTextColor: Colors.black87,
        internalPadding: 0,
        showLoadingAnimation: false,
        stepRadius: 8,
        showStepBorder: false,
        steps: steps, // تمرير القائمة بعد التصفية
        onStepReached: (index) {},
      ),
    );
  }
}

class StepperRate extends StatelessWidget {
  final ColorsApp colorsApp = ColorsApp(); // تأكد من تعريف ColorsApp

  // تمرير الخطوة النشطة كمُعامل

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
          height: 60,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              // عدد النجوم 5
              return GestureDetector(
                onTap: () {
                  val.Rate(index + 1);
                },
                onTapDown: (details) {
                  print("sss== ${details.toString()}");
                },
                child: Icon(
                  val.rate > index ? Icons.star : Icons.star_outline,
                  size: 40, // حجم النجوم
                  color: val.rate > index
                      ? Colors.yellow.shade700 // لون النجوم المفعلة
                      : Colors.grey.shade400, // لون النجوم غير المفعلة
                ),
              );
            }),
          ));
    });
  }
}
