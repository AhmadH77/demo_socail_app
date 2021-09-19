import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app_demo/screens/watching_page.dart';
import 'package:social_app_demo/ui/home/home_page/watching_page.dart' as watch;
import 'package:social_app_demo/ui/home/home_page/watching_page_new.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List<Widget> pages = [];
  ScrollController controller = ScrollController();
  var _isVisible = true;
  late PersistentTabController _controller;

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          setState(() {
            _controller.index = 0;
          });
          print('${_controller.index}');
        },
        icon: Icon(CupertinoIcons.home),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          setState(() {
            _controller.index = 1;
          });
          print('${_controller.index}');
        },
        icon: Icon(Icons.ondemand_video_outlined,),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          setState(() {
            _controller.index = 2;
          });
          print('${_controller.index}');
        },
        icon: Icon(CupertinoIcons.plus, color: Colors.black,),
        activeColorPrimary: CupertinoColors.white,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          setState(() {
            _controller.index = 3;
          });
          print('${_controller.index}');
        },
        icon: _controller.index == 3 ? Image.asset('assets/icons/LightningBlack.png'):Image.asset('assets/icons/Lightning.png'),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          setState(() {
            _controller.index = 4;
          });
          print('${_controller.index}');
        },
        icon: Icon(Icons.storefront_rounded),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  setVisible(value) {
    setState(() {
      _isVisible = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    pages = [
      watch.Watching(false),
      Watching(setVisible),
      Home(setVisible),
      Home(setVisible),
      Home(setVisible),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: pages,
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          boxShadow: [BoxShadow(blurRadius: 5)],
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style2, // Choose the nav bar style with this property.
      ),
    );

  }
}
