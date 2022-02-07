
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souk/controllers/helperCart.dart';
import 'package:souk/view/utils/CrossPlatformSvg.dart';

import '../../../constant.dart';
import 'Cart/CartScreen.dart';
import 'Categories/CategoriesScreen.dart';
import 'Home/HomeScreen.dart';
import 'MoreScreenes/MoreScreen.dart';
import 'Orders/OrderScreen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({Key? key}) : super(key: key);

  @override
  _HomeBottomNavBarState createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  PersistentTabController? _controller;
  String? Cardchack;
  Future<void> chack() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Cardchack = prefs.getString("Cardchack");
      print("Cardchack----->$Cardchack");
    });
  }
  @override
  void initState() {
    chack();
    HelperCart().db.then((value){
      print("value $value");
    });
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);

  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      CategoriesScreen(),
      CartScreen(),
      OrderScreen(),
      MoreScreen()
    ];
  }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_outlined),
        title: "Home",

        activeColorPrimary: primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.widgets_outlined),
        title: "Categories",
        activeColorPrimary: primarycolor,
        inactiveColorPrimary:Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_cart,color:Colors.white,size: 30,),
        title: " ",

        activeColorPrimary:primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.work_outline_outlined),
        title: "Orders",

        activeColorPrimary:primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.settings),
        title: "More",

        activeColorPrimary:primarycolor,
        inactiveColorPrimary: Color(0xff707070),
      ),

    ];
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:_onBackPressed,
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        navBarHeight: 60,
        backgroundColor: white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears.
        stateManagement: true,
        onItemSelected: (int) {
          setState(() {}); // This is required to update the nav bar if Android back button is pressed
        },
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument.
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(2.0),
          colorBehindNavBar: Colors.grey,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOutCubic,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
      ),
    );
  }
  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('هل تود الخروج من التطبيق ؟'),
          // content: Text('Do you want to exit the App'),
          actions: <Widget>[
            FlatButton(
              minWidth: MediaQuery.of(context).size.width/3,
              color: Colors.red,
              child: Text('لا',style: TextStyle(color: white),),
              onPressed: () {
                Navigator.of(context).pop(false); //Will not exit the App
              },
            ),
            FlatButton(
              minWidth: MediaQuery.of(context).size.width/3,

              color: primarydarkcolor,
              child: Text('نعم',style: TextStyle(color: white),),
              onPressed: () => exit(0),

              // onPressed: () {
              //   // onPressed: ()=> exit(0),
              //
              //   // Navigator.of(context).pop(true); //Will exit the App
              // },
            )
          ],
        );
      },
    ) ??
        false;
  }
}
