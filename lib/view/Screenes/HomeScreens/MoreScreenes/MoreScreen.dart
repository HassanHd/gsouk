
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souk/view/Screenes/auth/LoginScreen.dart';
import 'package:souk/view/utils/CrossPlatformSvg.dart';
import 'package:souk/view/utils/custom_listtile.dart';
import 'package:souk/view/utils/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../constant.dart';
import 'About.dart';
import 'DataPolicyScreen.dart';
import 'FAQScreen.dart';
import 'NotificationScreen.dart';
import 'SupportScreen.dart';
import 'TermsScreen.dart';


class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // centerTitle: true,
        title: CustomText(
          text: "More",
          color: primarycolor,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_ios,
        //     color: primarycolor,
        //     size: 35,
        //   ),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(

          children: [
            CustomListTile(text: "About",icons: "assats/icons/info.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return AboutScreen();
                }));
              },
            ),
            CustomListTile(text: "Change Language",icons: "assats/icons/translation.svg",

            onTap: () async {
              if (EasyLocalization.of(context)!.locale ==
                  Locale('en', 'EN')) {
                context.locale = Locale('ar', 'AR');
                SharedPreferences prefs =
                await SharedPreferences.getInstance();
                prefs.setString("lang", "ar_AR");
              }
              else if (EasyLocalization.of(context)!.locale ==
                  Locale('ar', 'AR')) {
                context.locale = Locale('en', 'EN');
                SharedPreferences prefs =
                await SharedPreferences.getInstance();
                prefs.setString("lang", "en_EN");
              }
            },
            ),
            CustomListTile(text: "Notifications",icons: "assats/icons/bell.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return NotificationScreen();
                }));
              },
            ),
            CustomListTile(text: "Share App",icons: "assats/icons/share.svg",
              onTap: () {
                // Share.share(
                //     'Download ASC app at https://play.google.com/store/apps/details?id=com.allsportscourts.optimalsolutions');
              },

            ),
            CustomListTile(text: "Data Policy",icons: "assats/icons/secure.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return DataPolicyScreen();
                }));
              },
            ),
            CustomListTile(text: "Terms & Conditions",icons: "assats/icons/terms-and-conditions.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return TermsScreen();
                }));
              },
            ),
            CustomListTile(text: "Rate Us",icons: "assats/icons/star.svg",

              onTap: (){
                opinurl("https://play.google.com/store/apps/details?id=com.allsportscourts.optimalsolutions");
              },
            ),
            CustomListTile(text: "FAQ",icons: "assats/icons/faq.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return FAQScreen();
                }));
              },
            ),
            CustomListTile(text: "Support",icons: "assats/icons/suport.svg",
              onTap: (){
                Navigator.of(context,rootNavigator: true).push( CupertinoPageRoute(builder: (BuildContext context) {
                  return SupportScreen();
                }));
              },
            ),

            CustomListTile(text: "Logout",icons: "assats/icons/logout.svg",

              onTap: () async {
                // SharedPreferences preferences =
                // await SharedPreferences.getInstance();
                // await preferences.clear();
                Navigator.of(context,rootNavigator: true).pushAndRemoveUntil(
                  CupertinoPageRoute(
                    builder: (BuildContext context) {
                      return LoginScreen();
                    },
                  ),
                      (_) => false,
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height/30,),
            CustomText(text:"V1.0.0",color: primarycolor,textAlign: TextAlign.center,fontWeight: FontWeight.bold,fontSize: 21,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: (){
                        opinurl("https://www.facebook.com/optimalsolutionscorp");
                      }
                      ,child: CrossPlatformSvg.asset("assats/icons/facebooklogo.svg",width: 30,height: 30)),
                  SizedBox(width: 10,),
                  GestureDetector(
                      onTap: (){
                        opinurl("https://www.instagram.com/optimalsolutionscorp/");
                      },
                      child: CrossPlatformSvg.asset("assats/icons/instagram.svg",width: 30,height: 30)),
                ],),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/15,),






          ],
        ),
      ),
    );
  }
  void opinurl(String url)async {
    var urllanch=url;
    if(await canLaunch(urllanch)){
      await launch(urllanch);
    }else{
      await launch(urllanch);
    }
  }
}
