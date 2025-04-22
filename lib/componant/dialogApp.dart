import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/app_text_style.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/constant.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/componant/generated/assets.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DialogApp {
  ColorsApp colorsApp = new ColorsApp();
  // late ConfettiController _confettiController;
  Future<void> checkdialog(BuildContext context, VoidCallback func) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return CustomSuccessAlertDialog(onPressedOk: func);
      },
    );
  }

  GlobalKey<FormState> formstateAddErea = GlobalKey();
  Future<void> DeleteErea(
      BuildContext context, String title, int id, VoidCallback func) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return Form(
            key: formstateAddErea,
            child: AlertDialog(
              backgroundColor: Colors.white,
              shadowColor: Colors.white,

              scrollable: true,
              // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
              // title: Text('Verify'),
              elevation: 10,
              content: Container(
                  padding: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        alignment: Alignment.center,
                        child: Text(
                          "ddddddddddddddddd",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          height: 1,
                          color: Colors.grey.shade300,
                          thickness: 2,
                          endIndent: 130,
                          indent: 130,
                        ),
                      ),
                    ],
                  )),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonApp(
                      title:
                          "${langLocal.langLocal['back']!['${val.languagebox.get("language")}']}",
                      func: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    ButtonApp(
                      title:
                          "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                      func: func,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
      },
    );
  }

  Future<void> Notificat(BuildContext context, VoidCallback func) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return Form(
            key: formstateAddErea,
            child: val.oneNotificat == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Directionality(
                    textDirection: TextDirection.rtl,
                    child: AlertDialog(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.white,
                      scrollable: true,
                      titleTextStyle:
                          TextStyle(fontSize: 20, color: Colors.black),
                      title: Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                AssetImage("assets/images/logo.png"),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  val.oneNotificat['data']["title"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          val.oneNotificat['data']["is_read"] == 0
                              ? Icon(
                                  Icons.circle,
                                  size: 10,
                                  color: Colors.blue,
                                )
                              : SizedBox(),
                        ],
                      ),
                      elevation: 10,
                      content: Text(
                        textAlign: TextAlign.center,
                        val.oneNotificat['data']["description"],
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      actions: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          child: ButtonApp(
                            title:
                                "${langLocal.langLocal['ok']!['${val.languagebox.get("language")}']}",
                            func: func,
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        });
      },
    );
  }
}

class CustomSuccessAlertDialog extends StatefulWidget {
  final Function() onPressedOk;
  const CustomSuccessAlertDialog({
    super.key,
    required this.onPressedOk,
  });

  @override
  State<CustomSuccessAlertDialog> createState() =>
      _CustomSuccessAlertDialogState();
}

class _CustomSuccessAlertDialogState extends State<CustomSuccessAlertDialog> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  void showConfetti() {
    _confettiController.play();
  }

  @override
  Widget build(BuildContext context) {
    showConfetti();
    return Consumer<Control>(builder: (context, val, child) {
      return val.data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              title: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  val.data['status'] == true
                      ? "assets/images/seccess.png"
                      : "assets/images/error.png",
                  width: 60,
                ),
              ),
              titlePadding: const EdgeInsets.all(16),
              content: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    val.data['status'] == true
                        ? ConfettiWidget(
                            confettiController: _confettiController,
                            blastDirectionality: BlastDirectionality.explosive,
                            shouldLoop: false,
                            colors: [
                              Colors.red,
                              Colors.blue,
                              Colors.green,
                              Colors.yellow,
                              Colors.orange
                            ],
                          )
                        : SizedBox(),
                    Text(
                      val.data['message'].toString(),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.style14W400(context),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    ButtonApp(
                      title: "موافق",
                      func: val.data['status'] == true
                          ? widget.onPressedOk
                          : () {
                              Navigator.of(context).pop();
                            },
                    )
                  ],
                ),
              ),
            );
    });
  }
}
