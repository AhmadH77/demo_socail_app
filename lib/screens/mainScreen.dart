import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/src/provider.dart';
import 'package:social_app_demo/provider/live_page_controller.dart';
import 'package:social_app_demo/screens/live_strem.dart';
import 'package:social_app_demo/screens/shortie.dart';
import 'package:social_app_demo/screens/watching_page.dart';
import 'package:social_app_demo/ui/home/home_page/watching_page.dart' as watch;
import 'package:social_app_demo/ui/home/home_page/watching_page_new.dart';
import 'package:social_app_demo/widgets/dialogs/new_content.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/mainScreen';
  final int index;
  const MainScreen({Key? key, this.index = 0}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  List<Widget> pages = [];
  ScrollController controller = ScrollController();
  var _isVisible = true;
  late PersistentTabController _controller;

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          if(_controller.index == 2)
            context.read<LivePageController>().engine.destroy();
          setState(() {
            _controller.index = 0;
          });

          print('${_controller.index}');
        },
        icon: _controller.index == 0
            ? SvgPicture.asset('assets/icons/House.svg')
            : SvgPicture.asset('assets/icons/HouseOff.svg'),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          if(_controller.index == 2)
            context.read<LivePageController>().engine.destroy();
          setState(() {
            _controller.index = 1;
          });

          print('${_controller.index}');
        },
        icon: _controller.index != 1
            ? SvgPicture.asset('assets/icons/MonitorPlayOff.svg')
            : SvgPicture.asset('assets/icons/MonitorPlay.svg'),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          setState(() {
            _controller.index = 2;
          });
          // NewContentDialog().show(context);
          print('${_controller.index}');
        },
        icon: SvgPicture.asset('assets/icons/Plus.svg'),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          if(_controller.index == 2)
            context.read<LivePageController>().engine.destroy();
          setState(() {
            _controller.index = 3;
          });
          print('${_controller.index}');
        },
        icon: _controller.index == 3
            ?  SvgPicture.asset('assets/icons/LightningMain.svg',)
            :  SvgPicture.asset('assets/icons/LightningOffMain.svg',),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        onPressed: (ctx) {
          if(_controller.index == 2)
            context.read<LivePageController>().engine.destroy();
          setState(() {
            _controller.index = 4;
          });
          print('${_controller.index}');
        },
        icon: _controller.index == 4
            ?  SvgPicture.asset('assets/icons/Storefront.svg',)
            :  SvgPicture.asset('assets/icons/Storefront.svg',),
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
    _controller = PersistentTabController(initialIndex: widget.index);
    pages = [
      watch.Watching(false),
      // Home(setVisible),

      Watching(),
      // Home(setVisible),

      LiveStream(isBroadcaster: true,),
      // Home(setVisible),

      Shortie(),
      // Home(setVisible),

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
        items: _navBarsItems(context),
        confineInSafeArea: true,
        backgroundColor: Colors.white, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          // boxShadow: [BoxShadow(blurRadius: 5)],
          // border: Border.all(color: Colors.black),
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
