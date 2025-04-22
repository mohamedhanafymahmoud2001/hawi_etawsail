import 'package:flutter/material.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/main/main_view.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../constant.dart';

class WebWallet extends StatefulWidget {
  final String paymentToken; // استلام التوكين من شاشة أخرى

  WebWallet({required this.paymentToken});

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebWallet> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // إعداد الـ WebViewController
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted) // لتفعيل JavaScript
      ..setBackgroundColor(
          Colors.transparent) // للتأكد من عرض الخلفية بشكل صحيح
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('Started loading: $url');
          },
          onPageFinished: (String url) {
            print('Finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            print('Error: ${error.description}');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentToken));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "${langLocal.langLocal['webPage']!['${val.languagebox.get("language")}']}",
          ),
        ),
        body: WebViewWidget(controller: _controller),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            val.AllWallet();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          child: Text(
            "${langLocal.langLocal['back']!['${val.languagebox.get("language")}']}",

          ),
        ),
      );
    });
  }
}
