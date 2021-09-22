import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/provider/currentPage.dart';
import 'package:social_app_demo/screens/watching_pages/explorer.dart';
import 'package:social_app_demo/screens/watching_pages/live.dart';
import 'package:social_app_demo/util/const.dart';
import 'package:social_app_demo/widgets/leftRoundedClipper.dart';
import 'package:social_app_demo/widgets/roundedClipper.dart';
import 'package:provider/provider.dart';
import 'package:social_app_demo/widgets/tabBar.dart' as tab;

class Home extends StatefulWidget {
  const Home(set_state, {Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin{

  late TabController tabController;
  late AnimationController _controller;
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
    tabController = TabController(length: 3, vsync: this);

    pages = [Live(), Explorer(), Explorer()];//Trending(widget.set_state)
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
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
    print('index  ${tabController.index}');

    return Scaffold(
      body: Container(
        child:
          Text('test3'),
      ),
    );


    // return Scaffold(
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
    //             title: Padding(
    //               padding: const EdgeInsets.only(bottom: 0.0),
    //               child: Container(
    //                 // color: Constants.orangeLight,
    //                 child: Stack(
    //                   children: [
    //                     !_isVisible
    //                         ? ClipPath(
    //                       clipper: RoundedClipper(),
    //                       child: AnimatedContainer(
    //                         duration: Duration(milliseconds: 400),
    //                         width: animation.value,
    //                         height: animation.value <= 150
    //                             ? 150
    //                             : animation.value,
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
    //                             height: animation2.value,
    //                             //<= 150 ? 200 :animation.value,
    //                             decoration: BoxDecoration(
    //                               color: Constants.orangeDark,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     )
    //                         : SizedBox(),
    //
    //                     !_isVisible
    //                         ? Align(
    //                         alignment: Alignment.centerLeft,
    //                         child: Padding(
    //                           padding: const EdgeInsets.all(10.0),
    //                           child: Row(
    //                             children: [
    //                               Container(
    //                                 width: 30,
    //                                 height: 30,
    //                                 decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(50),
    //                                     image: DecorationImage(
    //                                         image: Image.asset('assets/images/rick.jpg').image
    //                                     )
    //                                 ),
    //                               ),
    //                               context.watch<CurrentPage>().index == 0
    //                                   ? Padding(
    //                                 padding: const EdgeInsets.only(
    //                                     left: 8.0),
    //                                 child: Icon(
    //                                   Icons.circle,
    //                                   color: Colors.red,
    //                                   size: _isVisible ? 20 : 15,
    //                                 ),
    //                               )
    //                                   : SizedBox(),
    //                               Padding(
    //                                 padding:
    //                                 const EdgeInsets.only(left: 10.0,right: 5),
    //                                 child: Text(
    //                                   titles[context.watch<CurrentPage>().index],
    //                                   style: TextStyle(
    //                                       color: Colors.white,
    //                                       fontSize: !firstScroll
    //                                           ? (controller.offset > 0.0
    //                                           ? 30
    //                                           : 50)
    //                                           : 50,
    //                                       fontFamily: 'semipop'),
    //                                 ),
    //                               ),
    //                               SvgPicture.asset(
    //                                 'assets/icons/VideoCamera.svg',
    //                                 height: 20,width: 20,
    //                                 color: Colors.black,
    //                               ),
    //                               // Image.asset('assets/icons/VideoCamera.png',width: 20,height: 20,),
    //
    //                               // Spacer(),
    //                             ],
    //                           ),
    //                         ))
    //                         : SizedBox(),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             background: Container(
    //               color: Constants.orangeLight,
    //               child: Stack(
    //                 children: [
    //                   ClipPath(
    //                     clipper: RoundedClipper(),
    //                     child: AnimatedContainer(
    //                       duration: Duration(milliseconds: 400),
    //                       width: animation.value,
    //                       height:
    //                       animation.value <= 150 ? 150 : animation.value,
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
    //                           height: animation2.value,
    //                           //<= 150 ? 200 :animation.value,
    //                           decoration: BoxDecoration(
    //                             color: Constants.orangeDark,
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   _isVisible
    //                       ? Align(
    //                     alignment: Alignment.topLeft,
    //                     child: SafeArea(
    //
    //                       child: Padding(
    //                         padding: const EdgeInsets.all(5.0),
    //                         child: Padding(
    //                           padding: const EdgeInsets.symmetric(
    //                               horizontal: 25),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                             children: [
    //                               Container(
    //                                 width: 50,
    //                                 height: 50,
    //                                 decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(50),
    //                                     image: DecorationImage(
    //                                         image: Image.asset('assets/images/rick.jpg').image
    //                                     )
    //                                 ),
    //                               ),
    //                               Row(
    //                                 children: [
    //                                   Padding(
    //                                     padding:
    //                                     const EdgeInsets.only(right: 14),
    //                                     child: SvgPicture.asset(
    //                                       'assets/icons/MagnifyingGlass.svg',
    //                                       color: Colors.white,
    //                                     ),
    //                                   ),
    //                                   Padding(
    //                                     padding:
    //                                     const EdgeInsets.only(right: 14),
    //                                     child: SvgPicture.asset(
    //                                       'assets/icons/BellRinging.svg',
    //                                       color: Colors.white,
    //                                     ),
    //                                   ),
    //                                   SvgPicture.asset(
    //                                     'assets/icons/PaperPlane.svg',
    //                                     color: Colors.white,
    //                                   ),
    //                                 ],
    //                               ),
    //
    //
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                       : SizedBox(),
    //
    //                 ],
    //               ),
    //             ),
    //           ),
    //           bottom: PreferredSize(
    //             preferredSize: Size(MediaQuery.of(context).size.width, 50),
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               mainAxisSize: MainAxisSize.min,
    //               children: [
    //                 Stack(
    //                   fit: StackFit.loose,
    //                   children: [
    //                     _isVisible
    //                         ? Align(
    //                       alignment: Alignment.centerLeft,
    //                       child: Padding(
    //                         padding: isScrolling
    //                             ? EdgeInsets.only(top: 0, left: 10)
    //                             : EdgeInsets.only(top: 30, left: 10),
    //                         child: Row(
    //                           children: [
    //
    //                             context.watch<CurrentPage>().index == 0
    //                                 ? Padding(
    //                               padding: const EdgeInsets.only(
    //                                   left: 8.0, right: 5),
    //                               child: Icon(
    //                                 Icons.circle,
    //                                 color: Colors.red,
    //                                 size: _isVisible ? 20 : 15,
    //                               ),
    //                             )
    //                                 : SizedBox(),
    //                             Padding(
    //                               padding:
    //                               const EdgeInsets.only(left: 10.0),
    //                               child: Text(
    //                                 titles[context.watch<CurrentPage>().index],
    //                                 style: TextStyle(
    //                                     color: Colors.white,
    //                                     fontSize: !firstScroll
    //                                         ? (controller.offset > 0.0
    //                                         ? 30
    //                                         : 50)
    //                                         : 50,
    //                                     fontWeight: FontWeight.bold),
    //                               ),
    //                             ),
    //                             SvgPicture.asset(
    //                               'assets/icons/VideoCamera.svg',
    //                               height: 20,width: 20,
    //                               color: Colors.black,
    //                             ),
    //                             // Spacer(),
    //                           ],
    //                         ),
    //                       ),
    //                     )
    //                         : SizedBox(),
    //                     !_isVisible || (_isVisible && !firstScroll && controller.offset > 75 )
    //                         ? Align(
    //                       alignment: Alignment.topLeft,
    //                       child: Padding(
    //                           padding: !isScrolling && !firstScroll
    //                               ? (controller.offset == 0.0
    //                               ? EdgeInsets.only(
    //                               bottom: 60.0, left: 3, right: 3)
    //                               : EdgeInsets.only(
    //                               bottom: 10.0, left: 8, right: 8))
    //                               : EdgeInsets.only(
    //                               bottom: 10.0, left: 8, right: 8),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.end,
    //                             children: [
    //                               Padding(
    //                                 padding:
    //                                 const EdgeInsets.only(right: 14),
    //                                 child: SvgPicture.asset(
    //                                   'assets/icons/MagnifyingGlass.svg',
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                               Padding(
    //                                 padding:
    //                                 const EdgeInsets.only(right: 14),
    //                                 child: SvgPicture.asset(
    //                                   'assets/icons/BellRinging.svg',
    //                                   color: Colors.white,
    //                                 ),
    //                               ),
    //                               SvgPicture.asset(
    //                                 'assets/icons/PaperPlane.svg',
    //                                 color: Colors.white,
    //                               ),
    //
    //                             ],
    //                           )
    //                       ),
    //                     )
    //                         :SizedBox()
    //                   ],
    //                 ),
    //                 Align(
    //                   alignment: Alignment.bottomCenter,
    //                   child:
    //                   Container(
    //                     child: tab.TabBar(
    //
    //
    //                       controller: tabController,
    //
    //                       indicator: BoxDecoration(
    //
    //                           borderRadius: tabController.index != 0
    //                               ? (tabController.index == 1
    //                               ? BorderRadius.only(
    //                               bottomRight: Radius.circular(20),bottomLeft: Radius.circular(20))
    //                               : BorderRadius.only(
    //                               bottomLeft: Radius.circular(20)))
    //                               : BorderRadius.only(bottomRight: Radius.circular(20))),
    //                       tabs: [
    //                         Tab(
    //
    //                           text: 'test1',
    //                         ),
    //                         Tab(
    //                           text: 'test2',
    //                         ),
    //                         Tab(
    //                           text: 'test3',
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   // CurvedNavigationBar(
    //                   //   key: _bottomNavigationKey,
    //                   //   height: 50,
    //                   //   color: Colors.white,
    //                   //   buttonBackgroundColor: Colors.transparent,
    //                   //   backgroundColor: Colors.transparent,
    //                   //   animationCurve: Curves.decelerate,//elasticOut,//fastOutSlowIn,
    //                   //   animationDuration: Duration(milliseconds: 800),
    //                   //   index: context.watch<CurrentPage>().index,
    //                   //   onTap: (value) {
    //                   //     print('test $value');
    //                   //     context.read<CurrentPage>().increment(value);
    //                   //
    //                   //     switch (value) {
    //                   //       case 0:
    //                   //         animation = Tween<double>(begin: 125, end: 125)
    //                   //             .animate(_controller);
    //                   //         animation2 = Tween<double>(begin: 125, end: 125)
    //                   //             .animate(_controller);
    //                   //         break;
    //                   //       case 1:
    //                   //         animation = Tween<double>(begin: 125, end: 150)
    //                   //             .animate(_controller);
    //                   //         break;
    //                   //       case 2:
    //                   //         animation = Tween<double>(begin: 150, end: 175)
    //                   //             .animate(_controller);
    //                   //
    //                   //         animation2 = Tween<double>(begin: 150, end: 200)
    //                   //             .animate(_controller);
    //                   //         break;
    //                   //     }
    //                   //     // _bottomNavigationKey.currentState!.setState(() {
    //                   //     //   index = value;
    //                   //     // });
    //                   //   },
    //                   //   items: [
    //                   //     Text(
    //                   //       'Live',
    //                   //       style: context.watch<CurrentPage>().index == 0
    //                   //           ? TextStyle(
    //                   //           color: Colors.white,
    //                   //           fontSize: 13,
    //                   //           fontFamily: 'semipop')
    //                   //           : TextStyle(
    //                   //           color: Colors.black54,
    //                   //           fontSize: 13,
    //                   //           fontFamily: 'regular'),
    //                   //     ),
    //                   //     Text(
    //                   //       'Trending',
    //                   //       style: context.watch<CurrentPage>().index == 1
    //                   //           ? TextStyle(
    //                   //           color: Colors.white,
    //                   //           fontSize: 13,
    //                   //           fontFamily: 'semipop')
    //                   //           : TextStyle(
    //                   //           color: Colors.black54,
    //                   //           fontSize: 13,
    //                   //           fontFamily: 'regular'),
    //                   //     ),
    //                   //     Row(
    //                   //       mainAxisSize: MainAxisSize.min,
    //                   //       mainAxisAlignment: MainAxisAlignment.center,
    //                   //       children: [
    //                   //         Text(
    //                   //           'Explorer',
    //                   //           style: context.watch<CurrentPage>().index == 2
    //                   //               ? TextStyle(
    //                   //               color: Colors.white,
    //                   //               fontSize: 13,
    //                   //               fontFamily: 'semipop')
    //                   //               : TextStyle(
    //                   //               color: Colors.black54,
    //                   //               fontSize: 13,
    //                   //               fontFamily: 'regular'),
    //                   //         ),
    //                   //         SvgPicture.asset(
    //                   //           'assets/icons/Faders.svg',
    //                   //           height: 20,width: 20,
    //                   //           color: Colors.black,
    //                   //         ),
    //                   //       ],
    //                   //     ),
    //                   //
    //                   //
    //                   //   ],
    //                   // ),
    //                 ),
    //
    //               ],
    //             ),
    //           ),
    //         ),
    //       ];
    //     },
    //     body: Container(
    //       child: tab.TabBarView(
    //           controller: tabController,
    //
    //           children: [
    //             Live(),
    //             Text('test2'),
    //             Text('test3'),
    //           ]),
    //     ),
    //   ),
    // );
  }
}
