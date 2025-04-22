import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class NotificationsView extends StatelessWidget {
  NotificationsView({super.key});
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: ColorsApp().colorbody,
          appBar: AppBar(
            leadingWidth: 0,
            leading: SizedBox(),
            elevation: 0,
            backgroundColor: ColorsApp().colorbody,
            title: Text(
              "${langLocal.langLocal['notifications']!['${val.languagebox.get("language")}']}",

              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: ColorsApp().colorgreen2,
              ),
            ),
            actions: [
              Container(
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF9F9F9),
                ),
                child: IconButton(
                  icon: Center(
                    child: SvgPicture.asset(
                      Assets.imagesBell,
                      width: 20,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF9F9F9),
                ),
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
          body: val.notificat == null
              ? Center(child: CircularProgressIndicator())
              : val.notificat['status'] == false
                  ? Center(
                      child: NoData(),
                    )
                  : ListView.separated(
                      itemCount: val.notificat['data'].length,
                      itemBuilder: (context, i) {
                        return MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            val.OneNotificat(val.notificat['data'][i]["id"], i);
                            dialogApp.Notificat(context, () {
                              Navigator.of(context).pop();
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("assets/images/logo.png"),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            val.notificat['data'][i]["title"],
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    val.notificat['data'][i]["is_read"] == 0
                                        ? Icon(
                                            Icons.circle,
                                            size: 10,
                                            color: Colors.blue,
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  margin: EdgeInsets.only(right: 60),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    val.notificat['data'][i]["description"],
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider();
                      },
                    ),
        ),
      );
    });
  }
}
