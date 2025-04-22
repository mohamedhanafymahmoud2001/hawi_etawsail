import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/auth/auth.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class OnboardingView5 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnboardingView5();
  }
}

class _OnboardingView5 extends State<OnboardingView5> {
  // const OnboardingView5({super.key});
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).Countries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        backgroundColor: ColorsApp().colorbody,
        body: val.countries == null
            ? Center(child: CircularProgressIndicator())
            : val.countries['status'] == "false"
                ? Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Center(
                      child: NoData(),
                    ),
                  )
                : Column(
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
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade200),
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
                            ],
                          ),
                        ),
                      ),
                      Text("${langLocal.langLocal['onBoardingTitle5']!['${val.languagebox.get("language")}']}",

                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: val.countries['data'].length,
                          itemBuilder: (context, i) => Container(
                                margin: EdgeInsets.only(bottom: 13),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: MaterialButton(
                                  elevation: 0,
                                  onPressed: () {
                                    val.choseCountry_id(
                                        val.countries['data'][i]['id']);
                                    print(val.countries['data'][i]['id']);
                                  },
                                  color: ColorsApp().colorbody,
                                  minWidth: double.infinity,
                                  height: 48,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                    side: val.country_id ==
                                            val.countries['data'][i]['id']
                                        ? BorderSide(color: Colors.black)
                                        : BorderSide(
                                            color: Colors.grey.shade200),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network(
                                        "${val.api.ip}/${val.countries['data'][i]['image']}",
                                        width: 32,
                                        height: 23,
                                      ),
                                      Text(
                                        "${val.countries['data'][i]['country']}",
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
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
                            ]),
                            OnboardingButton(
                              backgroundColor: ColorsApp().colorgreen1,
                              titleColor: ColorsApp().colorbody,
                              onPressed: () {
                                if (val.country_id != -1) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => Auth()),
                                    (Route<dynamic> route) => false,
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${langLocal.langLocal['onBoarding5']!['${val.languagebox.get("language")}']}",
                                      ),
                                      duration: Duration(
                                          seconds: 1), // تختفي بعد 3 ثوانٍ
                                    ),
                                  );
                                }
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
    });
  }
}
