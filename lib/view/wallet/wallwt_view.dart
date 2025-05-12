import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/input.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/view/order/cridet.dart';
import 'package:hawy_altawsil/view/wallet/webWallet.dart';
import 'package:hawy_altawsil/view/wallet/widgets/item_wallel.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';
import '../notifications/notifications_view.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    DialogApp dialogApp = new DialogApp();
    return Consumer<Control>(builder: (context, val, child) {
      return val.allwallet == null
          ? Center(child: CircularProgressIndicator())
          : val.allwallet['status'] == false
              ? NoData()
              : Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Directionality(
                    textDirection: val.direction,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 165,
                          decoration: BoxDecoration(
                            color: Color(0xff303030),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                Assets.imagesShapesCards,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.asset(
                                  Assets.imagesNoiseBackground,
                                  fit: BoxFit.fill,
                                  height: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "${langLocal.langLocal['current_balance']!['${val.languagebox.get("language")}']}",
                                            style: TextStyle(
                                                color: colorsApp.colorbody,
                                                fontSize: 10,
                                                fontFamily: "Lemonada"),
                                          ),
                                          Image.asset(
                                            Assets.imagesGroupCart,
                                            width: 35,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.all(10),
                                                child: Text(
                                                  "${val.allwallet['data']['balance']['currency']}",
                                                  style: TextStyle(
                                                      color:
                                                          colorsApp.colorbody,
                                                      fontSize: 14,
                                                      fontFamily: "Lemonada"),
                                                )),
                                            Text(
                                              "${double.parse(val.allwallet['data']['balance']['amount']).toInt()}",
                                              style: TextStyle(
                                                  color: colorsApp.colorbody,
                                                  fontSize: 32,
                                                  fontFamily: "Lemonada"),
                                            ),
                                            Container(
                                              height: 35,
                                              alignment: Alignment.bottomCenter,
                                              child: Text(
                                                ".${val.allwallet['data']['balance']['amount'][val.allwallet['data']['balance']['amount'].length - 2]}${val.allwallet['data']['balance']['amount'][val.allwallet['data']['balance']['amount'].length - 1]}",
                                                style: TextStyle(
                                                    color: colorsApp.colorbody,
                                                    fontSize: 14,
                                                    fontFamily: "Lemonada"),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        // alignment: Alignment.centerLeft,
                                        width: double.infinity,
                                        child: Text(
                                          textAlign: TextAlign.end,
                                          "${val.allwallet['data']['name']}",
                                          style: TextStyle(
                                              color: colorsApp.colorbody,
                                              fontSize: 14,
                                              fontFamily: "Lemonada"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        MaterialButton(
                          onPressed: () {
                            double amount = 0.0;
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      backgroundColor: ColorsApp().colorbody,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      contentPadding: EdgeInsets.all(16),
                                      content: SizedBox(
                                        width: double.maxFinite,
                                        height: 250,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.red,
                                                  ),
                                                  padding: EdgeInsets.all(5),
                                                  child: Center(
                                                    child: GestureDetector(
                                                      child: Icon(
                                                        Icons.close,
                                                        color: Colors.white,
                                                        size: 12,
                                                      ),
                                                      onTap: () =>
                                                          Navigator.pop(
                                                              context),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 32),
                                            Text(
                                              "${langLocal.langLocal['add_amount']!['${val.languagebox.get("language")}']}",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: ColorsApp()
                                                    .colorgreen2, // لون العنوان
                                              ),
                                            ),
                                            SizedBox(height: 22),
                                            InputAppRwchargeWallet(
                                                hint: "0.00",
                                                controler: val
                                                    .api.amountRechargeWallet,
                                                keyboard: TextInputType.number),
                                            Spacer(),
                                            MaterialButton(
                                              onPressed: () {
                                                if (val.api.amountRechargeWallet
                                                    .text.isNotEmpty) {
                                                  val.RechargeWallet();
                                                  // Navigator.of(context).pop();
                                                  dialogApp.checkdialog(context,
                                                      () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            WebWallet(
                                                                paymentToken:
                                                                    "${val.rechargewallet['data']['payment_url']}"),
                                                      ),
                                                    );
                                                  });
                                                } else {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "${langLocal.langLocal['add_amount_first']!['${val.languagebox.get("language")}']}",
                                                      ),
                                                      duration: Duration(
                                                          seconds:
                                                              3), // تختفي بعد 3 ثوانٍ
                                                    ),
                                                  );
                                                }
                                              },
                                              minWidth: 100,
                                              height: 45,
                                              color: ColorsApp().colorblackApp,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: Text(
                                                "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 12,
                                                    color:
                                                        ColorsApp().colorbody),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
                          padding: EdgeInsetsDirectional.zero,
                          color: ColorsApp().colorgreen1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 16,
                              ),
                              Text(
                                "${langLocal.langLocal['add_wallet']!['${val.languagebox.get("language")}']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: ColorsApp().colorbody,
                                ),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                width: 35,
                                height: 35,
                                margin: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ColorsApp().colorgreen2,
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.north_east,
                                  color: Colors.white,
                                  size: 20,
                                )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "${langLocal.langLocal['recent_cash_transactions']!['${val.languagebox.get("language")}']}",
                            style: TextStyle(
                              color: ColorsApp().colorgreen2,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          child: ListView.builder(
                            itemCount: val.allwallet['data']['wallets'].length,
                            itemBuilder: (context, i) {
                              String createdAt = val.allwallet['data']
                                      ['wallets'][i]["created_at"] ??
                                  "2000-01-01T00:00:00.000000Z";
                              DateTime dateTime = DateTime.parse(createdAt);
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ItemWallet(
                                  date:
                                      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}",
                                  price: val.allwallet['data']['wallets'][i]
                                      ["amount"],
                                  type: val.allwallet['data']['wallets'][i]
                                      ["type"],
                                  currency: val.allwallet['data']['balance']
                                      ['currency'],
                                ),
                              );
                            },
                            // separatorBuilder: (BuildContext context, int index) {
                            //   return SizedBox(height: 16);
                            // },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
    });
  }
}
