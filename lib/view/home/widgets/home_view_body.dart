import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';
import 'home_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {
                val.OrderSender();
                val.SwitchOrderType("send");
                Navigator.of(context).pushNamed("myorders");
              },
              child: Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Color(0xFF464855),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    right: 3,
                    child: Image.asset(
                      Assets.imagesShapes,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 16,
                          ),
                          Text(
                            "${langLocal.langLocal['my_orders']!['${val.languagebox.get("language")}']}",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Image.asset(
                            Assets.imagesBox,
                            width: 40,
                          ),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ),
            (val.home['data']['order'] as List).isEmpty
                ? Container(height: 300, child: Center(child: NoData()))
                : Container(
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: val.home['data']['order'].length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          return ItemHome(
                            data: val.home['data']['order'][i],
                          );
                        }),
                  ),
          ],
        ),
      );
    });
  }
}
