import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/ImageView.dart';
import 'package:hawy_altawsil/componant/app_text_style.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/myOrders/detailsOrder/containerdetails.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class Details extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Details();
  }
}

class _Details extends State<Details> {
  ColorsApp colorsApp = new ColorsApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorsApp.colorbody,
        body: Consumer<Control>(builder: (context, val, child) {
          return val.showOrder == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : val.showOrder['status'] == false
                  ? Center(child: NoData())
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    width: double.infinity,
                                    height: 175,
                                    color: colorsApp.colorblackApp,
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: colorsApp.colorbody,
                                          child: IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(
                                                  Icons.keyboard_arrow_left)),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(right: 20),
                                            child: Text(
                                              textAlign: TextAlign.center,
                                              "${langLocal.langLocal['my_orders']!['${val.languagebox.get("language")}']}",
                                              style: TextStyle(
                                                  fontFamily: "Cairo",
                                                  color: colorsApp.colorbody,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 30),
                                      height: 100,
                                      width: 100,
                                      child: Image.asset(
                                          "assets/images/order.png"))
                                ],
                              ),

                              //مهم حدا متابعة الطلب
                              //create', 'bookOrder', 'receiveOrder', 'finished', 'back', 'finishedBack', 'cancelled'
                              Container(
                                margin: EdgeInsets.only(top: 130),
                                child: AnimatedSwitcher(
                                    switchInCurve: Curves.easeInCirc,
                                    switchOutCurve: Curves.easeInCirc,
                                    duration: Duration(milliseconds: 500),
                                    child: (val.showOrder['data']['status'] ==
                                                    'finished' ||
                                                val.showOrder['data']
                                                        ['status'] ==
                                                    'finishedBack') &&
                                            val.showOrder['data']['rate'] ==
                                                null &&
                                            val.switchdetailscontainer == "rate"
                                        ? ContainerRate()
                                        : val.switchdetailscontainer == "delete"
                                            ? ContainerDelete()
                                            : ContainerDetails(
                                                status:
                                                    '${val.showOrder['data']['status']}',
                                                idoreder:
                                                    "${val.showOrder['data']['orderNumber']}",
                                                data: val.showOrder['data'],
                                              )),
                              ),
                              // ContainerRate(), // ContainerDelete()//ContainerDetails()
                              // val.switchdetailscontainer == "details"
                              //     ? ContainerDetails(
                              //         status:
                              //             '${val.showOrder['data']['status']}',
                              //         idoreder:
                              //             "${val.showOrder['data']['orderNumber']}",
                              //         data: val.showOrder['data'],
                              //       )
                              //     : ContainerDelete(), //ContainerRate() // ContainerDelete()//ContainerDetails()
                            ],
                          ),
                          //body
                          Container(
                              margin: EdgeInsets.all(20),
                              child: Text(
                                "${val.showOrder['data']['product_name']}",
                                style: TextStyle(
                                    color: colorsApp.colorgreen2,
                                    fontSize: 18,
                                    fontFamily: "Cairo"),
                              )),
                          Container(
                            height: 350,
                            margin: EdgeInsets.all(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20), //
                              child: ImageView(
                                  image:
                                      "${val.api.ip}/${val.showOrder['data']['image']}"),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: colorsApp.colorbody,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  textAlign: TextAlign.end,
                                  "${val.showOrder['data']['secret_key']}",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: "Cairo"),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      val.Copy(context,
                                          "${val.showOrder['data']['secret_key']}");
                                    },
                                    child: Icon(Icons.copy, size: 17)),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  "${langLocal.langLocal['code']!['${val.languagebox.get("language")}']}",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: Color(0xffF1F1F1),
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                    "${langLocal.langLocal['productDescription']!['${val.languagebox.get("language")}']}"),
                                Text(
                                  textAlign: TextAlign.end,
                                  "${val.showOrder['data']['description']}",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: "Cairo"),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: colorsApp.colorbody,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  textAlign: TextAlign.end,
                                  val.showOrder['data']['cover'] == "cover"
                                      ? "${langLocal.langLocal['packaged']!['${val.languagebox.get("language")}']}"
                                      : "${langLocal.langLocal['notPackaged']!['${val.languagebox.get("language")}']}",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: "Cairo"),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  "${langLocal.langLocal['packaging']!['${val.languagebox.get("language")}']}",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: Color(0xffF1F1F1),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  textAlign: TextAlign.end,
                                  val.showOrder['data']['break'] == "break"
                                      ? "${langLocal.langLocal['fragile']!['${val.languagebox.get("language")}']}"
                                      : "${langLocal.langLocal['notFragile']!['${val.languagebox.get("language")}']}",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: "Cairo"),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  "${langLocal.langLocal['fragility']!['${val.languagebox.get("language")}']}",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: colorsApp.colorbody,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  textAlign: TextAlign.end,
                                  "كجم ${val.showOrder['data']['weight']} ",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: "Cairo"),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  "${langLocal.langLocal['packageWeight']!['${val.languagebox.get("language")}']}",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: Color(0xffF1F1F1),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  textAlign: TextAlign.end,
                                  "${val.showOrder['data']['name_receiver']}",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: "Cairo"),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  "${langLocal.langLocal['recipientName']!['${val.languagebox.get("language")}']}",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: colorsApp.colorbody,
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  textAlign: TextAlign.end,
                                  "${val.showOrder['data']['phone_receiver']}",
                                  style: TextStyle(
                                      fontSize: 11, fontFamily: "Cairo"),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Text(
                                  "${langLocal.langLocal['recipientPhone']!['${val.languagebox.get("language")}']}",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            width: double.infinity,
                            color: Color(0xffF1F1F1),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    textAlign: TextAlign.start,
                                    "${val.showOrder['data']['city_receiver']} ${val.showOrder['data']['neighborhood_receiver']} ${val.showOrder['data']['area_street_receiver']} ${val.showOrder['data']['build_number_receiver']}",
                                    style: TextStyle(
                                        fontSize: 11, fontFamily: "Cairo"),
                                  ),
                                ),
                                Text(
                                  "${langLocal.langLocal['deliveryPoint']!['${val.languagebox.get("language")}']}",
                                ),
                              ],
                            ),
                          ),

                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(16.0),
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${val.showOrder['data']['totalPrice']} ",
                                      style: AppTextStyles.style12W500(context)
                                          .copyWith(
                                        fontFamily: "Noto Kufi Arabic",
                                        color: colorsApp.colorblackApp,
                                      ),
                                    ),
                                    Expanded(child: SizedBox()),
                                    Text(
                                      "${langLocal.langLocal['cost']!['${val.languagebox.get("language")}']}",
                                      style: AppTextStyles.style12W500(context)
                                          .copyWith(
                                        fontFamily: "Noto Kufi Arabic",
                                        color: colorsApp.colorblackApp,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Text(
                                      "${val.showOrder['data']['coverPrice']} ",
                                      style: AppTextStyles.style10W500(context),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${langLocal.langLocal['packagingService']!['${val.languagebox.get("language")}']}",
                                      style: AppTextStyles.style10W500(context),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 24,
                                    ),
                                    Text(
                                      "${val.showOrder['data']['basePrice']}",
                                      style: AppTextStyles.style10W500(context),
                                    ),
                                    Spacer(),
                                    Text(
                                      "${langLocal.langLocal['deliveryService']!['${val.languagebox.get("language")}']}",
                                      style: AppTextStyles.style10W500(context),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          ButtonApp(
                              title: "تقديم شكوى",
                              func: () {
                                //${val.showOrder['data']['orderNumber']}
                                val.api.orderNumber.text =
                                    val.showOrder['data']['orderNumber'];
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                                val.ChangeScreenMain(3);
                              }),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    );
        }));
  }
}
