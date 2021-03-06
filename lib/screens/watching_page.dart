import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:social_app_demo/provider/currentPage.dart';
import 'package:social_app_demo/screens/watching_pages/explorer.dart';
import 'package:social_app_demo/screens/watching_pages/live.dart';
import 'package:social_app_demo/widgets/curved_nav_bar/curvedNavigationBar.dart' as curvedBar;
import 'package:social_app_demo/util/const.dart';
import 'package:provider/provider.dart';
import 'package:social_app_demo/widgets/leftRoundedClipper.dart';
import 'package:social_app_demo/widgets/roundedClipper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Watching extends StatefulWidget {

  const Watching( {Key? key}) : super(key: key);

  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<Watching> with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController topBarAnimationController;
  late ScrollController controller = ScrollController(
    initialScrollOffset: 0,
  );
  late Animation<double> animation, animation2;
  final double startingHeight = 20.0;
  List pages = [];
  int index = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List titles = ['Live', 'Trending', 'Explorer'];
  var _isVisible = true, isScrolling = false, firstScroll = true;

  @override
  void initState() {
    super.initState();
    pages = [Live(basePageScrollController: controller), Explorer(), Explorer()];//Trending(widget.set_state)
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    topBarAnimationController = AnimationController(vsync: this, duration: Duration(seconds: 5));
    animation = Tween<double>(begin: 125, end: 150).animate(_controller);
    animation2 = Tween<double>(begin: 125, end: 150).animate(_controller);
    _controller.forward(from: 0.0);

    controller.addListener(() {
      print('offset  ${controller.offset}');
      setState(() {
        isScrolling = true;
        firstScroll = false;
      });
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
      if (controller.position.atEdge)
        setState(() {
          isScrolling = false;
        });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('$firstScroll -- $isScrolling  --  $_isVisible  ${topBarAnimationController.value}');
    return Scaffold(
      body: NestedScrollView(
        controller: controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              brightness: Brightness.dark,
              expandedHeight: 200.0,
              backgroundColor:  Constants.orangeLight,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 0.0),
                  child: Container(
                    color: Constants.orangeLight,
                    child: Stack(
                      children: [

                        isScrolling
                          ? ClipPath(
                          clipper: RoundedClipper(),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 400),
                            width: animation.value,
                            height:
                            animation.value <= 150 ? 150 : animation.value,
                            decoration: BoxDecoration(
                              color: Constants.orangeDark,
                            ),
                          ),
                          // Container(width:100,height:150,color: Constants.orangeDark,),
                        ): SizedBox(),
                        isScrolling
                          ? Align(
                          alignment: Alignment.bottomRight,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(0 / 360),
                            child: ClipPath(
                              clipper: LeftRoundedClipper(flip: true),
                              //LeftRoundedClipper(),//LeftRoundedClipper(),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                width: animation2.value - 10,
                                height: animation2.value,
                                //<= 150 ? 200 :animation.value,
                                decoration: BoxDecoration(
                                  color: Constants.orangeDark,
                                ),
                              ),
                            ),
                          ),
                        ): SizedBox(),

                        !_isVisible
                            ? ClipPath(
                                clipper: RoundedClipper(),
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  width: animation.value,
                                  height: animation.value <= 150
                                      ? 150
                                      : animation.value,
                                  decoration: BoxDecoration(
                                    color: Constants.orangeDark,
                                  ),
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
                                    //LeftRoundedClipper(),//LeftRoundedClipper(),
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 400),
                                      width: animation2.value - 10,
                                      height: animation2.value,
                                      //<= 150 ? 200 :animation.value,
                                      decoration: BoxDecoration(
                                        color: Constants.orangeDark,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(),

                        !_isVisible
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0,top: 30),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(50),
                                            image: DecorationImage(
                                                image: Image.asset('assets/images/rick.jpg').image
                                            )
                                        ),
                                      ),
                                      context.watch<CurrentPage>().index == 0
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.red,
                                                size: _isVisible ? 20 : 15,
                                              ),
                                            )
                                          : SizedBox(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0,right: 5),
                                        child: Text(
                                          titles[context.watch<CurrentPage>().index] ,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: !firstScroll
                                                  ? (controller.offset > 0.0
                                                      ? 30
                                                      : 50)
                                                  : 50,
                                              fontFamily: 'semipop'),
                                        ),
                                      ),
                                      context.watch<CurrentPage>().index == 0
                                      ? SvgPicture.asset(
                                        'assets/icons/VideoCamera.svg',
                                      height: 15,width: 15,
                                      color: Colors.black,
                                    ) : SizedBox(),


                                      // Spacer(),
                                      // !_isVisible || (_isVisible && !firstScroll && controller.offset > 0 )
                                      //     ? Padding(
                                      //   padding: !isScrolling && !firstScroll
                                      //       ? (controller.offset == 0.0
                                      //       ? EdgeInsets.only(
                                      //       top: 40.0, left: 8, right: 5)
                                      //       : EdgeInsets.only(
                                      //       top: 40.0, left: 8, right: 5))
                                      //       : EdgeInsets.only(
                                      //       top: 40.0, left: 8, right: 5),
                                      //       child: Align(
                                      //   alignment: Alignment.topLeft,
                                      //   child: Row(
                                      //       mainAxisAlignment: MainAxisAlignment.end,
                                      //       children: [
                                      //         Padding(
                                      //           padding:
                                      //           const EdgeInsets.only(right: 30),
                                      //           child: SvgPicture.asset(
                                      //             'assets/icons/MagnifyingGlass.svg',
                                      //             color: Colors.white,
                                      //           ),
                                      //         ),
                                      //         Padding(
                                      //           padding:
                                      //           const EdgeInsets.only(right: 14),
                                      //           child: SvgPicture.asset(
                                      //             'assets/icons/BellRinging.svg',
                                      //             color: Colors.white,
                                      //           ),
                                      //         ),
                                      //         SvgPicture.asset(
                                      //           'assets/icons/PaperPlane.svg',
                                      //           color: Colors.white,
                                      //         ),
                                      //
                                      //       ],
                                      //   ),
                                      // ),
                                      //     )
                                      //     :SizedBox()
                                    ],
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
                      ClipPath(
                        clipper: RoundedClipper(),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 400),
                          width: animation.value,
                          height:
                              animation.value <= 150 ? 150 : animation.value,
                          decoration: BoxDecoration(
                            color: Constants.orangeDark,
                          ),
                        ),
                        // Container(width:100,height:150,color: Constants.orangeDark,),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: RotationTransition(
                          turns: AlwaysStoppedAnimation(0 / 360),
                          child: ClipPath(
                            clipper: LeftRoundedClipper(flip: true),
                            //LeftRoundedClipper(),//LeftRoundedClipper(),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              width: animation2.value - 10,
                              height: animation2.value,
                              //<= 150 ? 200 :animation.value,
                              decoration: BoxDecoration(
                                color: Constants.orangeDark,
                              ),
                            ),
                          ),
                        ),
                      ),
                      _isVisible
                          ? Align(
                        alignment: Alignment.topLeft,
                        child: SafeArea(

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: DecorationImage(
                                      image: Image.asset('assets/images/rick.jpg').image
                                    )
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 14,),
                                      child: SvgPicture.asset(
                                        'assets/icons/MagnifyingGlass.svg',
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(right: 14),
                                      child: SvgPicture.asset(
                                        'assets/icons/BellRinging.svg',
                                        color: Colors.white,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      'assets/icons/PaperPlane.svg',
                                      color: Colors.white,
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        ),
                      )
                          : SizedBox(),

                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, _isVisible ? 60 : 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Stack(
                      fit: StackFit.loose,
                      children: [


                        _isVisible
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: isScrolling
                                      ? EdgeInsets.only(top: 0, left: 10)
                                      : EdgeInsets.only(top: 30, left: 10),
                                  child: Row(
                                    children: [

                                      context.watch<CurrentPage>().index == 0
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, right: 5),
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.red,
                                                size: _isVisible ? 20 : 15,
                                              ),
                                            )
                                          : SizedBox(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          titles[context.watch<CurrentPage>().index] ,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: !firstScroll
                                                  ? (controller.offset > 0.0
                                                      ? 30
                                                      : 50)
                                                  : 50,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      context.watch<CurrentPage>().index == 0
                                      ?SvgPicture.asset(
                                        'assets/icons/VideoCamera.svg',
                                        height: 20,width: 20,
                                        color: Colors.black,
                                      ):SizedBox(),
                                      // Spacer(),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox(),

                        !_isVisible || (_isVisible && !firstScroll && controller.offset > 75 )
                            ? Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                              padding: !isScrolling && !firstScroll
                                  ? (controller.offset == 0.0
                                  ? EdgeInsets.only(
                                  bottom: 60.0, left: 8, right: 8)
                                  : EdgeInsets.only(
                                  bottom: 20.0, left: 8, right: 8))
                                  : EdgeInsets.only(
                                  bottom: 15.0, left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(right: 14),
                                    child: SvgPicture.asset(
                                      'assets/icons/MagnifyingGlass.svg',
                                      color: Colors.white,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(right: 14),
                                    child: SvgPicture.asset(
                                      'assets/icons/BellRinging.svg',
                                      color: Colors.white,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/PaperPlane.svg',
                                    color: Colors.white,
                                  ),

                                ],
                              )
                          ),
                        )
                            :SizedBox(),


                      ],
                    ),
                    Visibility(
                      visible: _isVisible,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child:
                        curvedBar.CurvedNavigationBar(
                          key: _bottomNavigationKey,
                          source: 1,
                          height: 37,
                          color: Colors.white,
                          buttonBackgroundColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          animationCurve: Curves.decelerate,//elasticOut,//fastOutSlowIn,
                          animationDuration: Duration(milliseconds: 400),
                          index: context.watch<CurrentPage>().index,
                          onTap: (value) {
                            print('test $value');
                            context.read<CurrentPage>().increment(value);

                            switch (value) {
                              case 0:
                                animation = Tween<double>(begin: 125, end: 125)
                                    .animate(_controller);
                                animation2 = Tween<double>(begin: 125, end: 125)
                                    .animate(_controller);
                                break;
                              case 1:
                                animation = Tween<double>(begin: 125, end: 150)
                                    .animate(_controller);
                                break;
                              case 2:
                                animation = Tween<double>(begin: 150, end: 175)
                                    .animate(_controller);

                                animation2 = Tween<double>(begin: 150, end: 200)
                                    .animate(_controller);
                                break;
                            }
                            // _bottomNavigationKey.currentState!.setState(() {
                            //   index = value;
                            // });
                          },
                          items: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Live',
                                style: context.watch<CurrentPage>().index == 0
                                    ? TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'semipop')
                                    : TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'regular'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                'Trending',
                                style: context.watch<CurrentPage>().index == 1
                                    ? TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: 'semipop')
                                    : TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontFamily: 'regular'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0,right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Explorer',
                                      style: context.watch<CurrentPage>().index == 2
                                          ? TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontFamily: 'semipop')
                                          : TextStyle(
                                          color: Colors.black54,
                                          fontSize: 14,
                                          fontFamily: 'regular'),
                                    ),
                                  ),
                                  InkWell(
                                      onTap: (){},
                                      child: SvgPicture.asset('assets/icons/Faders.svg',width: 20,))
                                ],
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: !_isVisible
              ? EdgeInsets.only(
                  top:  10,
                  left: 0,
                  bottom: 10,
                  right: 0,
                )
              : EdgeInsets.only(top: 5, left: 0, right: 0),
          child: pages[context.watch<CurrentPage>().index],
        ),
      ),
    );
  }
}
