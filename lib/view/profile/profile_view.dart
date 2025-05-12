import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/nodata.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:hawy_altawsil/view/auth/auth.dart';
import 'package:hawy_altawsil/view/myOrders/detailsOrder/containerdetails.dart';
import 'package:hawy_altawsil/view/profile/edit_profile_view.dart';
import 'package:provider/provider.dart';

import 'widgets/profile_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Consumer<Control>(builder: (context, val, child) {
          return Scaffold(
            backgroundColor: ColorsApp().colorbody,
            body: SafeArea(
              child: val.profile == null
                  ? Center(child: CircularProgressIndicator())
                  : val.profile['status'] == false
                      ? Container(width: double.infinity, child: NoData())
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Image.asset(Assets.imagesProfileShap2),
                                        Image.asset(Assets.imagesProfileShap1),
                                      ]),
                                  Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.grey.shade200),
                                            ),
                                            child: val.profile['data']
                                                        ['image'] ==
                                                    null
                                                ? Icon(
                                                    Icons.person_2_outlined,
                                                    color: Colors.grey,
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    child: Image.network(
                                                      "${val.api.ip}/${val.profile['data']['image']}",
                                                      fit: BoxFit.cover,
                                                    )),
                                          ),
                                          Positioned(
                                            bottom: 4,
                                            right: 4,
                                            child: Container(
                                              width: 26,
                                              height: 26,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        Colors.grey.shade200),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  Assets.imagesCamera,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        "مرحبًا بك",
                                        style: TextStyle(
                                          color: ColorsApp().colorgreen2,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "${val.profile['data']['first_name']} ${val.profile['data']['last_name']}",
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          GestureDetector(
                                            onTap: () {
                                              val.api.f_name_ed.text =
                                                  val.profile['data']
                                                      ['first_name'];
                                              val.api.l_name_ed.text = val
                                                  .profile['data']['last_name'];
                                              val.api.phone_ed.text =
                                                  val.profile['data']['phone'];

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EditProfileView(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 24,
                                              height: 24,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                        Colors.grey.shade200),
                                              ),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  Assets.imagesEdit,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                                height: 48,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          Colors.grey.shade200),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${val.profile['data']['last_name']}",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsApp()
                                                              .colorblackApp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Expanded(
                                            child: Container(
                                                height: 48,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                          Colors.grey.shade200),
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 12.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "${val.profile['data']['first_name']}",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: ColorsApp()
                                                              .colorblackApp,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ]),
                                    const SizedBox(height: 8),
                                    ProfileItem(
                                      label: "رقم الهاتف :",
                                      value: "${val.profile['data']['phone']}",
                                    ),
                                    ProfileItem(
                                      label: "الدولة :",
                                      value:
                                          "${val.profile['data']['country']}",
                                    ),
                                    // Expanded(child: SizedBox()),
                                    SizedBox(height: 20),
                                    MaterialButton(
                                      onPressed: () {
                                        val.LogOut();
                                        dialogApp.checkdialog(context, () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                            MaterialPageRoute(
                                                builder: (context) => Auth()),
                                            (Route<dynamic> route) => false,
                                          );
                                        });
                                      },
                                      child: Container(
                                        height: 48,
                                        width: 200,
                                        decoration: BoxDecoration(
                                          color: ColorsApp().colorblackApp,
                                          borderRadius:
                                              BorderRadius.circular(24),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "تسجيل الخروج",
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 13,
                                                fontFamily: "Cairo",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(
                                              size: 20,
                                              Icons.logout,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
            ),
          );
        }));
  }
}
