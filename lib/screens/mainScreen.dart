import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_app_demo/screens/watching_page.dart';

import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 0;
  List pages = [];
  ScrollController controller = ScrollController();
  var _isVisible = true;

  set_State(value) {
    setState(() {
      _isVisible = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      Home(set_State),
      Watching(set_State),
      Home(set_State),
      Home(set_State),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: pages[index],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Visibility(
          visible: _isVisible,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      icon: Icon(
                        Icons.home_filled,
                        color: index == 0 ? Colors.deepOrange : Colors.white,
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      icon: Icon(Icons.ondemand_video_sharp,
                          color:
                              index == 1 ? Colors.deepOrange : Colors.white)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      icon: Icon(Icons.flash_on_sharp,
                          color:
                              index == 2 ? Colors.deepOrange : Colors.white)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      icon: Icon(Icons.storefront_rounded,
                          color:
                              index == 3 ? Colors.deepOrange : Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
