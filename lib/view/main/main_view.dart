import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hawy_altawsil/componant/ImageView.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/view/main/bottom_nav_btn.dart';
import 'package:hawy_altawsil/view/main/clipper.dart';
import 'package:hawy_altawsil/view/main/size_config.dart';
import 'package:hawy_altawsil/view/order/choseTypeOrder.dart';
import 'package:hawy_altawsil/view/profile/profile_view.dart';
import 'package:hawy_altawsil/view/support/support_view.dart';
import 'package:hawy_altawsil/view/wallet/wallwt_view.dart';
import 'package:provider/provider.dart';

import '../home/home_view.dart';
import '../notifications/notifications_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  MainViewState createState() => MainViewState();
}

class MainViewState extends State<MainView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).Home();
      Provider.of<Control>(context, listen: false).Notificat();
    });
  }

  DialogApp dialogApp = new DialogApp();
  ColorsApp colorsApp = new ColorsApp();
  @override
  Widget build(BuildContext context) {
    AppSizes().init(context);
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 12,
              right: 16,
              left: 16,
            ),
            child: bottomNav(),
          ),
        ),
        backgroundColor: ColorsApp().colorbody,
        appBar: AppBar(
          leadingWidth: 0,
          leading: SizedBox(),
          elevation: 0,
          backgroundColor: ColorsApp().colorbody,
          title: val.home == null
              ? SizedBox()
              : val.home['status'] == false
                  ? Container()
                  : GestureDetector(
                      onTap: () {
                        val.Profile();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileView(),
                          ),
                        );
                      },
                      child: Container(
                        width: 180,
                        height: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              width: 1, color: ColorsApp().colorgreen1),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: val.home['data']['user']['image'] == null
                                    ? Icon(Icons.person_2_outlined,
                                        color: Colors.grey)
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: ImageView(
                                            image:
                                                "${val.api.ip}/${val.home['data']['user']['image']}")
                                        //  Image.network(
                                        //     "${val.api.ip}/${val.home['data']['user']['image']}"),
                                        ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "مرحبا",
                                    style: TextStyle(
                                      color: ColorsApp().colorgreen2,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Text(
                                    "${val.home['data']['user']['name']}",
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
          actions: [
            Stack(
              children: [
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
                    onPressed: () {
                      val.Notificat();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NotificationsView()));
                    },
                  ),
                ),
                val.home == null
                    ? SizedBox()
                    : val.home['status'] == false
                        ? Container()
                        : val.home['data']['notification'] == 0
                            ? SizedBox()
                            : CircleAvatar(
                                backgroundColor: colorsApp.colorgreen2,
                                radius: 8,
                                child: Text(
                                  "${val.home['data']['notification']}",
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white),
                                )),
              ],
            ),
            Container(
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF9F9F9),
              ),
              child: IconButton(
                icon: Center(
                    child: Text(
                  "AR",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                )),
                onPressed: () {},
              ),
            ),
            IconButton(
              icon: Image.asset(Assets.imagesLogo),
              onPressed: () {
                dialogApp.checkdialog(context, () {});
              },
            ),
          ],
        ),
        body: val.home == null
            ? Center(child: CircularProgressIndicator())
            : val.home['status'] == false
                ? Container(height: 300, child: Center(child: NoData()))
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: PageView(
                            onPageChanged: (value) {
                              setState(() {
                                val.currentIndex = value;
                              });
                            },
                            controller: val.pageController,
                            // physics: const NeverScrollableScrollPhysics(),
                            children: [
                              HomeView(),
                              ChoseTypeOrder(),
                              WalletView(),
                              SupportView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      );
    });
  }

  Widget bottomNav() {
    return Consumer<Control>(builder: (context, val, child) {
      return Material(
        borderRadius: BorderRadius.circular(30),
        color: Colors.transparent,
        elevation: 6,
        child: Container(
          height: AppSizes.blockSizeHorizontal * 18,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: AppSizes.blockSizeHorizontal * 3,
                right: AppSizes.blockSizeHorizontal * 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BottomNavBTN(
                      title: "الرئيسية",
                      onPressed: (valu) {
                        val.Home();
                        val.animateToPage(valu);
                      },
                      icon: Assets.imagesHouseLine,
                      currentIndex: val.currentIndex,
                      index: 0,
                    ),
                    BottomNavBTN(
                      title: "إنشاء طلب",
                      onPressed: (valu) {
                        val.animateToPage(valu);
                      },
                      icon: Assets.imagesPlus,
                      currentIndex: val.currentIndex,
                      index: 1,
                    ),
                    BottomNavBTN(
                      title: "المحفظة",
                      onPressed: (valu) {
                        val.AllWallet();
                        val.animateToPage(valu);
                      },
                      icon: Assets.imagesWallet,
                      currentIndex: val.currentIndex,
                      index: 2,
                    ),
                    BottomNavBTN(
                      title: "خدمة العملاء",
                      onPressed: (valu) {
                        val.animateToPage(valu);
                      },
                      icon: Assets.imagesHeadset,
                      currentIndex: val.currentIndex,
                      index: 3,
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.decelerate,
                top: 0,
                left: animatedPositionedLEftValue(val.currentIndex),
                child: Column(
                  children: [
                    Container(
                      height: AppSizes.blockSizeHorizontal * 1.0,
                      width: AppSizes.blockSizeHorizontal * 12,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: AppSizes.blockSizeHorizontal * 15,
                        width: AppSizes.blockSizeHorizontal * 12,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: gradient,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

final List<Color> gradient = [
  Colors.orange.withOpacity(0.5),
  Colors.orange.withOpacity(0.2),
  Colors.transparent
];

double animatedPositionedLEftValue(int currentIndex) {
  switch (currentIndex) {
    case 0:
      return AppSizes.blockSizeHorizontal * 7.5;
    case 1:
      return AppSizes.blockSizeHorizontal * 29.5;
    case 2:
      return AppSizes.blockSizeHorizontal * 50.5;
    case 3:
      return AppSizes.blockSizeHorizontal * 72;
    default:
      return 0;
  }
}
