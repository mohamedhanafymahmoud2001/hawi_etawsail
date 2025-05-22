import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/myOrders/detailsOrder/stepper.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

DialogApp dialogApp = new DialogApp();

class ContainerDetails extends StatelessWidget {
  ContainerDetails({
    super.key,
    required this.status,
    required this.idoreder,
    required this.data,
  });
  final String status;
  final String idoreder;
  var data;
  ColorsApp colorsApp = new ColorsApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10),
          height: 260,
          decoration: BoxDecoration(
              color: colorsApp.colorbody,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(7.0, 7),
                  spreadRadius: 5,
                  blurRadius: 10.0,
                )
              ]),

          //steper
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "ID :  $idoreder",
                      style: TextStyle(
                          fontFamily: "Cairo",
                          color: colorsApp.colorblackApp,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          val.Copy(context, "$idoreder");
                        },
                        child: Icon(Icons.copy, size: 17)),
                  ],
                ),
              ),
              //create', 'bookOrder', 'receiveOrder', 'finished', 'back', 'finishedBack', 'cancelled'
              StepperOrder(
                activeStep: status == "create"
                    ? 0
                    : status == "bookOrder"
                        ? 1
                        : status == "receiveOrder"
                            ? 2
                            : status == "finished"
                                ? 4
                                : status == "back"
                                    ? 3
                                    : status == "finishedBack"
                                        ? 5
                                        : 2,
                status: status,
              ),
              data['driver'] == null
                  ? Expanded(child: SizedBox())
                  : ListTile(
                      leading: CircleAvatar(
                          backgroundColor: colorsApp.colorgreen2,
                          radius: 23,
                          child: Icon(
                            Icons.person_2_outlined,
                            color: colorsApp.colorbody,
                            size: 30,
                          )),
                      title: Text(
                        "${data['driver']['first_name']} ${data['driver']['last_name']}",
                        style: TextStyle(color: colorsApp.colorblackApp),
                      ),
                      subtitle: Text(
                        "${data['driver']['phone']}",
                        style: TextStyle(color: colorsApp.colorblackApp),
                      ),
                      trailing: Text(
                        "${langLocal.langLocal['driver']!['${val.languagebox.get("language")}']}",
                        style: TextStyle(color: colorsApp.colorblackApp),
                      ),
                    ),
              status == "create"
                  ? ButtonOrder(
                      title:
                          "${langLocal.langLocal['cancelOrder']!['${val.languagebox.get("language")}']}",
                      func: () {
                        val.SwitchDetailsContainer("delete");
                      })
                  : SizedBox(),
            ],
          ));
    });
  }
}

class ContainerDelete extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10, top: 10),
          height: 160,
          decoration: BoxDecoration(
              color: colorsApp.colorbody,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(7.0, 7),
                  spreadRadius: 5,
                  blurRadius: 10.0,
                )
              ]),

          //steper
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      val.SwitchDetailsContainer("details");
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: colorsApp.colorgreen2,
                      child: Icon(
                        Icons.close,
                        color: colorsApp.colorbody,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  "${langLocal.langLocal['confirm_delete_order']!['${val.languagebox.get("language")}']}",
                  style: TextStyle(
                      fontFamily: "Cairo",
                      color: colorsApp.colorblackApp,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              ButtonOrder(
                title:
                    "${langLocal.langLocal['cancelOrder']!['${val.languagebox.get("language")}']}",
                func: () {
                  val.Cancel();
                  Future.delayed(Duration.zero, () {
                    if (context.mounted) {
                      dialogApp.checkdialog(context, () {
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      });
                    }
                  });
                },
              ),
            ],
          ));
    });
  }
}

class ContainerRate extends StatelessWidget {
  ColorsApp colorsApp = new ColorsApp();

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10, top: 10),
          height: 260,
          decoration: BoxDecoration(
              color: colorsApp.colorbody,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(7.0, 7),
                  spreadRadius: 5,
                  blurRadius: 10.0,
                )
              ]),

          //steper
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      val.SwitchDetailsContainer("details");
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: colorsApp.colorgreen2,
                      child: Icon(
                        Icons.close,
                        color: colorsApp.colorbody,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  textAlign: TextAlign.center,
                  "ID :  L98267MN07",
                  style: TextStyle(
                      fontFamily: "Cairo",
                      color: colorsApp.colorblackApp,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
              StepperRate(),
              Expanded(child: SizedBox()),
              ButtonOrder(
                  title:
                      "${langLocal.langLocal['rate_service']!['${val.languagebox.get("language")}']}",
                  func: () {
                    val.AddRate();
                    dialogApp.checkdialog(context, () {
                      // Navigator.of(context).pop();
                    });
                  }),
              SizedBox(
                height: 10,
              )
            ],
          ));
    });
  }
}
