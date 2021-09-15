import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/ui/home/explore_page/explore_page.dart';
import 'package:social_app_demo/ui/home/main_page/main_page.dart';
import 'package:social_app_demo/ui/home/trending_page/trending_page.dart';
import 'package:social_app_demo/util/const.dart';
import 'package:social_app_demo/widget/show_icons.dart';

import 'leftRoundedClipper.dart';

class WatchingNew extends StatefulWidget {
  final set_state;

  const WatchingNew(this.set_state, {Key? key}) : super(key: key);

  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<WatchingNew> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation, animation2;
  final double startingHeight = 20.0;
  List pages = [];
  int index = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List titles = [feed, trending, explore];
  late ScrollController controller = ScrollController(initialScrollOffset: 0,);
  var _isVisible = true , isScrolling = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print('offset  ${controller.offset}');
      setState(() {
        isScrolling = true;
      });
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            _isVisible = false;
            widget.set_state(_isVisible);
          });
        }


      } else {
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            setState(() {
              _isVisible = true;
              widget.set_state(_isVisible);
            });
          }
        }

      }
      if(controller.position.atEdge)
        setState(() {
          isScrolling = false;
        });
    });

    pages = [
      MainPage(
        set_state: widget.set_state,
      ),
      TrendingPage(set_state: widget.set_state),
      ExplorePage()
    ];
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 125, end: 150).animate(_controller);
    animation2 = Tween<double>(begin: 125, end: 150).animate(_controller);
    _controller.forward(from: 0.0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {



    return  Scaffold(
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title:  Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Container(
                    // color: Constants.orangeLight,
                    child: Stack(
                      children: [
                        !_isVisible
                            ? AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: animation.value,
                          height: animation.value <= 150 ? 150 : animation.value,
                          decoration: BoxDecoration(
                            color: Constants.orangeLight,//Colors.teal,
                          ),
                        )
                            : SizedBox(),
                        !_isVisible
                            ? Align(
                          alignment: Alignment.bottomRight,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(0 / 360),
                            child: ClipPath(
                              clipper: LeftRoundedClipper(flip: true),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                width: animation2.value - 10,
                                height: animation2.value *
                                    MediaQuery.of(context)
                                        .size
                                        .height, //<= 150 ? 200 :animation.value,
                                decoration: BoxDecoration(
                                    color:Constants.orangeLight,// Colors.teal,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.lightGreen.withGreen(10),
                                        Colors.greenAccent,
                                        Colors.greenAccent
                                      ],
                                    )),
                              ),
                            ),
                          ),
                        )
                            : SizedBox(),

                        !_isVisible
                            ? Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                titles[index],
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ))
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
                background: Container(
                  color: Constants.orangeLight,
                  child: Stack(
                    children: [


                      AnimatedContainer(
                        duration: Duration(milliseconds: 400),
                        width: animation.value,
                        height: animation.value <= 150 ? 150 : animation.value,
                        decoration: BoxDecoration(
                          color: Constants.orangeLight,//Colors.teal,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(0 / 360),
                          child: ClipPath(
                            clipper: LeftRoundedClipper(flip: true),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              width: animation2.value - 10,
                              height: animation2.value *
                                  MediaQuery.of(context)
                                      .size
                                      .height, //<= 150 ? 200 :animation.value,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.lightGreen.withGreen(10),
                                      Colors.greenAccent,
                                      Colors.greenAccent
                                    ],
                                  )),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),


              ),
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width , 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Stack(
                      fit: StackFit.loose,
                      children: [
                        _isVisible
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding:
                                isScrolling ? EdgeInsets.only(top: 0, left: tenDp):EdgeInsets.only(top: 30, left: tenDp),
                                child: ListTile(
                                    title: Text(
                                      titles[index],
                                      style: TextStyle(
                                          fontSize: fiftyDp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ))
                          : SizedBox(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: !isScrolling ? (_isVisible ? EdgeInsets.only(bottom: 70.0,left: 3 , right: 3):EdgeInsets.only(bottom: 10.0)):EdgeInsets.only(bottom: 10.0,left: 8 , right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                index == 0 && _isVisible
                                    ? ShowIcon(
                                  iconName: 'assets/icons/User.png',
                                  onIconTap: () {},
                                )
                                    : SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: fourteenDp),
                                        child: ShowIcon(
                                          iconName: 'assets/icons/MagnifyingGlass.png',
                                          onIconTap: () {},
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(right: fourteenDp),
                                        child: ShowIcon(
                                          iconName: 'assets/icons/BellRinging.png',
                                          onIconTap: () {},
                                        ),
                                      ),
                                      ShowIcon(
                                        iconName: 'assets/icons/PaperPlane.png',
                                        onIconTap: () {},
                                      ),
                                    ],
                                  ),
                                )
                                //  Spacer(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CurvedNavigationBar(
                        key: _bottomNavigationKey,
                        height: isScrolling ? 38 : 50,
                        color: Colors.white,
                        buttonBackgroundColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        animationCurve: Curves.easeInOut,
                        animationDuration: Duration(milliseconds: 600),
                        index: 0,
                        onTap: (value) {
                          switch (value) {
                            case 0:
                            /*    animation = Tween<double>(begin: 125, end: 0)
                            .animate(_controller);*/
                              animation2 = Tween<double>(begin: 125, end: 500)
                                  .animate(_controller);
                              break;
                            case 1:
                              animation2 = Tween<double>(begin: 125, end: 700)
                                  .animate(_controller);
                              /*  animation = Tween<double>(begin: -10, end: 50)
                            .animate(_controller);*/

                              break;
                            case 2:
                              animation = Tween<double>(begin: 125, end: 500)
                                  .animate(_controller);

                              animation2 = Tween<double>(begin: 150, end: 200)
                                  .animate(_controller);
                              break;
                          }
                          setState(() {
                            index = value;
                          });
                        },
                        items: [
                          Text(
                            Main,
                            style: index == 0
                                ? TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                                : TextStyle(color: Colors.black54),
                          ),
                          Text(
                            trending,
                            style: index == 1
                                ? TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                                : TextStyle(color: Colors.black54),
                          ),
                          Text(
                            explore,
                            style: index == 2
                                ? TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)
                                : TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ];
        },
        body: Text('ww'),
      ),
    );
  }
}
