import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:hawy_altawsil/view/auth/auth.dart';
import 'package:hawy_altawsil/view/auth/code.dart';
import 'package:hawy_altawsil/view/auth/resetpass/newpass.dart';
import 'package:hawy_altawsil/view/auth/resetpass/resetcode.dart';
import 'package:hawy_altawsil/view/auth/resetpass/resetphone.dart';
import 'package:hawy_altawsil/view/main/main_view.dart';
import 'package:hawy_altawsil/view/myOrders/detailsOrder/datails.dart';
import 'package:hawy_altawsil/view/myOrders/myOrders.dart';
import 'package:hawy_altawsil/view/onboarding/onboarding_view.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/onboarding_view2.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/onboarding_view3.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/onboarding_view4.dart';
import 'package:hawy_altawsil/view/onboarding/widgets/onboarding_view5.dart';
import 'package:hawy_altawsil/view/order/orde.dart';
import 'package:hawy_altawsil/view/splash/splash_view.dart' show SplashView;
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //for firbase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('language');
  await Hive.openBox('token');
  // قفل الشاشة على الوضع العمودي فقط
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    late Box tokenbox = Hive.box("token");
    return ChangeNotifierProvider(
        create: (context) {
          return Control();
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              "auth": (context) => Auth(),
              "code": (context) => Code(),
              "resetphone": (context) => ResetPhone(),
              "resetcode": (context) => ResetCode(),
              "newpass": (context) => NewPass(),
              "order": (context) => Order(),
              'myorders': (context) => MyOrders(),
              'details': (context) => Details(),
              'mainview': (context) => MainView(),
              'boarding1': (context) => OnboardingView1(),
              'boarding2': (context) => OnboardingView2(),
              'boarding3': (context) => OnboardingView3(),
              'boarding4': (context) => OnboardingView4(),
              'boarding5': (context) => OnboardingView5(),
            },
            home:
                SplashView() //OnboardingView1() //Langoage() // MainView()//Order()//Order()// Details() // MyOrders(),
            ));
  }
}
