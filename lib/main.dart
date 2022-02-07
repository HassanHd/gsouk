import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:souk/view/Screenes/auth/LoginScreen.dart';
import 'package:souk/view/utils/nave.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import 'constant.dart';
import 'controllers/ControlerView.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
      path: "resources/langs",
      supportedLocales: [
        Locale('en', 'EN'),
        Locale('ar', 'AR'),
      ],
      saveLocale: true,
      child: GetMaterialApp(
          debugShowCheckedModeBanner: false,

          home: MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Souk',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigationKey,
      routes: {
        "LoginScreen": (BuildContext context) => LoginScreen(),

      },
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.teal,
      ),
      home: AnimatedSplashScreen(
        backgroundColor: primarycolor,
        duration: 3000,
        splash:
        Image.asset(
          "assats/images/splash.jpg",
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.cover,
        ),



        splashIconSize: double.infinity,
        nextScreen:ControlerView(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,

      ),
    );
  }
}


