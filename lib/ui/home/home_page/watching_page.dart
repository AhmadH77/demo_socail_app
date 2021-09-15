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

class Watching extends StatefulWidget {
  final set_state;

  const Watching(this.set_state, {Key? key}) : super(key: key);

  @override
  _WatchState createState() => _WatchState();
}

class _WatchState extends State<Watching> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation, animation2;
  final double startingHeight = 20.0;
  List pages = [];
  int index = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  List titles = [feed, trending, explore];
  late ScrollController controller = ScrollController(initialScrollOffset: 0,);
  var _isVisible = true , isScrolling = false, firstScroll= true;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {


      setState(() {
        isScrolling = true;
        firstScroll = false;
      });
      print('offset  ${controller.offset}  $firstScroll');
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            _isVisible = false;
            // widget.set_state(_isVisible);
          });
        }


      } else {
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            setState(() {
              _isVisible = true;
              // widget.set_state(_isVisible);
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
                                        fontSize: !firstScroll ? (controller.offset > 0.0 ? 30 : fiftyDp):fiftyDp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )),
                            ))
                            : SizedBox(),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: !isScrolling && !firstScroll ? (controller.offset == 0.0 ? EdgeInsets.only(bottom: 70.0,left: 3 , right: 3):EdgeInsets.only(bottom: 10.0,left: 8 , right: 8)):EdgeInsets.only(bottom: 10.0,left: 8 , right: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                index == 0
                                    ? (firstScroll
                                    ? ShowIcon(
                                  iconName:
                                  'assets/icons/User.png',
                                  onIconTap: () {},
                                )
                                    : (controller.offset == 0.0
                                    ? ShowIcon(
                                  iconName:
                                  'assets/icons/User.png',
                                  onIconTap: () {},
                                )
                                    : SizedBox()))
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
                        height:  50,
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
        body:  pages[index],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, twoFiftyDp),
        child: Container(
          color: Colors.teal,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                width: animation.value,
                height: animation.value <= 150 ? 150 : animation.value,
                decoration: BoxDecoration(
                  color: Colors.teal,
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
              Align(
                alignment: Alignment.bottomCenter,
                child: CurvedNavigationBar(
                  key: _bottomNavigationKey,
                  height: 65,
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
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(bottom: sixtyDp, left: tenDp),
                    child: ListTile(
                        title: Text(
                      titles[index],
                      style: TextStyle(
                          fontSize: fiftyDp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  )),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: fiftyDp, left: twentyDp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index == 0
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
        ),
      ),
      // body: pages[index],
      body: DefaultTabController(
        length: pages.length,
        child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                SliverList(delegate: SliverChildListDelegate([]))
              ];
            },
            body: pages[index]),
      ),
    );

    // return  Scaffold(
    //   body: NestedScrollView(
    //     controller: controller,
    //     headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
    //       return <Widget>[
    //         SliverAppBar(
    //           expandedHeight: 200.0,
    //           floating: false,
    //           pinned: true,
    //           flexibleSpace: FlexibleSpaceBar(
    //             centerTitle: true,
    //             title:  Padding(
    //               padding: const EdgeInsets.only(bottom: 0.0),
    //               child: Container(
    //                 // color: Constants.orangeLight,
    //                 child: Stack(
    //                   children: [
    //
    //                     !_isVisible
    //                         ? ClipPath(
    //                       clipper: RoundedClipper(),
    //                       child: AnimatedContainer(
    //                         duration: Duration(milliseconds: 400),
    //                         width: animation.value,
    //                         height: animation.value <= 150 ? 150 : animation.value,
    //                         decoration: BoxDecoration(
    //                           color: Constants.orangeDark,
    //                         ),
    //                       ),
    //                     )
    //                         : SizedBox(),
    //                     !_isVisible
    //                         ? Align(
    //                       alignment: Alignment.bottomRight,
    //                       child: RotationTransition(
    //                         turns: AlwaysStoppedAnimation(0 / 360),
    //                         child: ClipPath(
    //                           clipper: LeftRoundedClipper(flip: true),
    //                           //LeftRoundedClipper(),//LeftRoundedClipper(),
    //                           child: AnimatedContainer(
    //                             duration: Duration(milliseconds: 400),
    //                             width: animation2.value - 10,
    //                             height: animation2.value, //<= 150 ? 200 :animation.value,
    //                             decoration: BoxDecoration(
    //                               color: Constants.orangeDark,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     )
    //                         : SizedBox(),
    //
    //
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             background: Container(
    //               color: Constants.orangeLight,
    //               child: Stack(
    //                 children: [
    //
    //                   ClipPath(
    //                     clipper: RoundedClipper(),
    //                     child: AnimatedContainer(
    //                       duration: Duration(milliseconds: 400),
    //                       width: animation.value,
    //                       height: animation.value <= 150 ? 150 : animation.value,
    //                       decoration: BoxDecoration(
    //                         color: Constants.orangeDark,
    //                       ),
    //                     ),
    //                     // Container(width:100,height:150,color: Constants.orangeDark,),
    //                   ),
    //                   Align(
    //                     alignment: Alignment.bottomRight,
    //                     child: RotationTransition(
    //                       turns: AlwaysStoppedAnimation(0 / 360),
    //                       child: ClipPath(
    //                         clipper: LeftRoundedClipper(flip: true),
    //                         //LeftRoundedClipper(),//LeftRoundedClipper(),
    //                         child: AnimatedContainer(
    //                           duration: Duration(milliseconds: 400),
    //                           width: animation2.value - 10,
    //                           height: animation2.value, //<= 150 ? 200 :animation.value,
    //                           decoration: BoxDecoration(
    //                             color: Constants.orangeDark,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   _isVisible
    //                       ? Align(
    //                     alignment: Alignment.centerLeft,
    //                     child: Padding(
    //                       padding: _isVisible ? EdgeInsets.only(top: 30.0) : EdgeInsets.only(bottom: 0.0),
    //                       child: Row(
    //                         children: [
    //                           index == 0
    //                               ? Padding(
    //                             padding: const EdgeInsets.only(left: 8.0),
    //                             child: Icon(
    //                               Icons.circle,
    //                               color: Colors.red,
    //                               size: _isVisible ? 20 : 15,
    //                             ),
    //                           )
    //                               :SizedBox(),
    //                           Padding(
    //                             padding: const EdgeInsets.only(left: 10.0),
    //                             child: Text(
    //                               titles[index],
    //                               style: TextStyle(
    //                                   fontSize: _isVisible? 50 : 30, fontWeight: FontWeight.bold),
    //                             ),
    //                           ),
    //
    //
    //                           // Spacer(),
    //
    //                         ],
    //                       ),
    //                     ),
    //                   )
    //                       : SizedBox(),
    //                 ],
    //               ),
    //             ),
    //
    //
    //           ),
    //           bottom: PreferredSize(
    //             preferredSize: Size(MediaQuery.of(context).size.width , 50),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Stack(
    //                   fit: StackFit.loose,
    //                   children: [
    //                     !_isVisible
    //                         ? Align(
    //                       alignment: Alignment.centerLeft,
    //                       child: Padding(
    //                         padding: _isVisible ? EdgeInsets.only(top: 30.0) : EdgeInsets.only(bottom: 0.0),
    //                         child: Row(
    //                           children: [
    //                             index == 0
    //                                 ? Padding(
    //                               padding: const EdgeInsets.only(left: 8.0),
    //                               child: Icon(
    //                                 Icons.circle,
    //                                 color: Colors.red,
    //                                 size: _isVisible ? 20 : 15,
    //                               ),
    //                             )
    //                                 :SizedBox(),
    //                             Padding(
    //                               padding: const EdgeInsets.only(left: 10.0),
    //                               child: Text(
    //                                 titles[index],
    //                                 style: TextStyle(
    //                                     fontSize: _isVisible? 50 : 30, fontWeight: FontWeight.bold),
    //                               ),
    //                             ),
    //
    //
    //                             // Spacer(),
    //
    //                           ],
    //                         ),
    //                       ),
    //                     )
    //                         : SizedBox(),
    //
    //                     Align(
    //                       alignment: Alignment.topRight,
    //                       child: Row(
    //                         mainAxisAlignment: MainAxisAlignment.end,
    //                         children: [
    //                           Padding(
    //                             padding: !isScrolling ? (_isVisible ? EdgeInsets.only(bottom: 62.0,left: 3 , right: 3):EdgeInsets.all( 3.0)):EdgeInsets.only(bottom: 3.0,left: 8 , right: 8),
    //                             child: IconButton(onPressed: () {},
    //                               icon: Image.asset('assets/icons/MagnifyingGlass.png', width: 20),//Icon(Icons.search,)
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: !isScrolling ? (_isVisible ? EdgeInsets.only(bottom: 62.0,left: 3 , right: 3):EdgeInsets.all( 3.0)):EdgeInsets.only(bottom: 3.0,left: 8 , right: 8),
    //                             child: IconButton(
    //                               onPressed: () {},
    //                               icon: Image.asset('assets/icons/BellRinging.png', width: 20,),//Icon(Icons.notifications_active,)
    //                             ),
    //                           ),
    //                           Padding(
    //                             padding: !isScrolling ? (_isVisible ? EdgeInsets.only(bottom: 62.0,left: 3 , right: 3):EdgeInsets.all( 3.0)):EdgeInsets.only(bottom: 3.0,left: 8 , right: 8),
    //                             child: IconButton(
    //                               onPressed: () {},
    //                               icon: Image.asset('assets/icons/User.png', width: 20),//Icon(Icons.person_outline)
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //                 Align(
    //                   alignment: Alignment.bottomCenter,
    //                   child: CurvedNavigationBar(
    //                     key: _bottomNavigationKey,
    //                     height:  isScrolling ? 38 : 50,// : 50,
    //                     color: Colors.white,
    //                     buttonBackgroundColor: Colors.transparent,
    //                     backgroundColor: Colors.transparent,
    //                     animationCurve: Curves.easeInOut,
    //                     animationDuration: Duration(milliseconds: 600),
    //                     index: 0,
    //                     onTap: (value) {
    //                       print('test $value');
    //                       switch (value) {
    //                         case 0:
    //                           animation = Tween<double>(begin: 125, end: 125)
    //                               .animate(_controller);
    //                           animation2 = Tween<double>(begin: 125, end: 125)
    //                               .animate(_controller);
    //                           break;
    //                         case 1:
    //                           animation = Tween<double>(begin: 125, end: 150)
    //                               .animate(_controller);
    //                           break;
    //                         case 2:
    //                           animation = Tween<double>(begin: 150, end: 175)
    //                               .animate(_controller);
    //
    //                           animation2 = Tween<double>(begin: 150, end: 200)
    //                               .animate(_controller);
    //                           break;
    //                       }
    //                       setState(() {
    //                         index = value;
    //                       });
    //                     },
    //                     items: [
    //                       Text(
    //                         'Live',
    //                         style: index == 0
    //                             ? TextStyle(
    //                             color: Colors.white, fontSize: 13,fontWeight: FontWeight.bold)
    //                             : TextStyle(color: Colors.black54, fontSize: 13,  fontWeight: FontWeight.normal),
    //                       ),
    //                       Text(
    //                         'Trending',
    //                         style: index == 1
    //                             ? TextStyle(
    //                             color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)
    //                             : TextStyle(color: Colors.black54 , fontSize: 13,  fontWeight: FontWeight.normal),
    //                       ),
    //                       Text(
    //                         'Explorer',
    //                         style: index == 2
    //                             ? TextStyle(
    //                             color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)
    //                             : TextStyle(color: Colors.black54, fontSize: 13,  fontWeight: FontWeight.normal),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ];
    //     },
    //     body: Padding(
    //       padding: !_isVisible ? EdgeInsets.only(top: isScrolling ?(controller.offset - 80).abs() : 150, left: 0, bottom: 10, right: 0,):EdgeInsets.only(top: 10, left: 0, right: 0),
    //       child: pages[index],
    //     ),
    //   ),
    // );
  }
}
