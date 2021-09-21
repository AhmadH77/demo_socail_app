import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/constants/theme_color.dart';
import 'package:social_app_demo/ui/home/explore_page/explore_page.dart';
import 'package:social_app_demo/ui/home/home_page/roundedClipper.dart';
import 'package:social_app_demo/ui/home/main_page/main_page.dart';
import 'package:social_app_demo/ui/home/trending_page/trending_page.dart';
import 'package:social_app_demo/ui/market_place/market_place.dart';
import 'package:social_app_demo/widget/show_svg_icon.dart';
import 'package:social_app_demo/widget/story_header.dart';
import 'package:social_app_demo/widgets/homeleftRoundedClipper.dart';

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
  List titles = [feed, trending, explore, ""];
  late ScrollController controller = ScrollController(
    initialScrollOffset: 0,
  );
  var _isVisible = true, isScrolling = false, firstScroll = true;

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
      if (controller.position.atEdge)
        setState(() {
          isScrolling = false;
        });
    });

    pages = [
      MainPage(
        set_state: widget.set_state,
      ),
      TrendingPage(set_state: widget.set_state),
      ExplorePage(),
      Container(),
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

  //todo add padding to title

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 1,
        child: NestedScrollView(
          controller: controller,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 300.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 0.0),
                    child: Container(
                      child: Stack(
                        children: [
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
                                      color:
                                          ThemeColors.topCurve, //Colors.teal,
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
                                      child: AnimatedContainer(
                                          duration: Duration(milliseconds: 400),
                                          width: animation2.value - 10,
                                          height: animation2
                                              .value /**
                                          MediaQuery.of(context)
                                          .size
                                          .height,*/
                                          ,
                                          //<= 150 ? 200 :animation.value,
                                          decoration: BoxDecoration(
                                            color: ThemeColors.topCurve,
                                          )
                                          // Colors.teal,
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
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              image: DecorationImage(
                                                  image: Image.asset(
                                                          'assets/images/a.jpg')
                                                      .image)),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            titles[index],
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'semipop',
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ))
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  background: Container(
                    color: ThemeColors.middleCURVE,
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
                              color: ThemeColors.topCurve,
                            ),
                          ),
                          // Container(width:100,height:150,color: Constants.orangeDark,),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: RotationTransition(
                            turns: AlwaysStoppedAnimation(0 / 360),
                            child: ClipPath(
                              clipper: HomeLeftRoundedClipper(flip: true),
                              //LeftRoundedClipper(),//LeftRoundedClipper(),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 400),
                                width: animation2.value - 10,
                                height: animation2.value,
                                //<= 150 ? 200 :animation.value,
                                decoration: BoxDecoration(
                                  color: ThemeColors.topCurve,
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
                                    padding: const EdgeInsets.all(5.0),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                image: DecorationImage(
                                                    image: Image.asset(
                                                            'assets/images/a.jpg')
                                                        .image)),
                                          ),
                                          Row(
                                            children: [
                                              ShowSvgIcon(
                                                color: Colors.white,
                                                iconName:
                                                    'assets/svg/MagnifyingGlass.svg',
                                                onIconTap: () {},
                                              ),
                                              ShowSvgIcon(
                                                color: Colors.white,
                                                iconName:
                                                    'assets/svg/BellRinging.svg',
                                                onIconTap: () {},
                                              ),
                                              ShowSvgIcon(
                                                color: Colors.white,
                                                iconName:
                                                    'assets/svg/PaperPlane.svg',
                                                onIconTap: () {},
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
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
                  preferredSize: Size(MediaQuery.of(context).size.width, 60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Stack(
                        fit: StackFit.loose,
                        children: [
                          !_isVisible ||
                                  (_isVisible &&
                                      !firstScroll &&
                                      controller.offset > 75)
                              ? Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                      padding: !isScrolling && !firstScroll
                                          ? (controller.offset == 0.0
                                              ? EdgeInsets.only(
                                                  bottom: 60.0,
                                                  left: 3,
                                                  right: 3)
                                              : EdgeInsets.only(
                                                  bottom: 10.0,
                                                  left: 8,
                                                  right: 8))
                                          : EdgeInsets.only(
                                              bottom: 10.0, left: 8, right: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ShowSvgIcon(
                                            iconName:
                                                'assets/svg/MagnifyingGlass.svg',
                                            onIconTap: () {},
                                            color: Colors.white,
                                          ),
                                          ShowSvgIcon(
                                            color: Colors.white,
                                            iconName:
                                                'assets/svg/BellRinging.svg',
                                            onIconTap: () {},
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: tenDp),
                                            child: ShowSvgIcon(
                                              color: Colors.white,
                                              iconName:
                                                  'assets/svg/PaperPlane.svg',
                                              onIconTap: () {},
                                            ),
                                          ),
                                        ],
                                      )),
                                )
                              : SizedBox(),
                          _isVisible
                              ? Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: isScrolling
                                        ? EdgeInsets.only(top: 10, left: tenDp)
                                        : EdgeInsets.only(
                                            top: oneFiftyDp, left: tenDp),
                                    child: ListTile(
                                        title: Text(
                                      titles[index],
                                      style: TextStyle(
                                          fontSize: !firstScroll
                                              ? (controller.offset > 0.0
                                                  ? 30
                                                  : fiftyDp)
                                              : fiftyDp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ))
                              : SizedBox(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CurvedNavigationBar(
                          key: _bottomNavigationKey,
                          height: 50,
                          color: Colors.white,
                          buttonBackgroundColor: Colors.transparent,
                          backgroundColor: Colors.transparent,
                          animationCurve: Curves.easeInOut,
                          animationDuration: Duration(milliseconds: 600),
                          index: 0,
                          onTap: (value) {
                            print("value $value");
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
                              case 3:
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MarketPlace(),
                                ));
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
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MarketPlace(),
                                ));
                              },
                              child: SvgPicture.asset(
                                'assets/svg/fader.svg',
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //header
              titles[index] == feed
                  ? SliverPersistentHeader(
                      floating: false,
                      delegate: _SliverContainerDelegate(
                        TabBar(
                          indicatorColor: Colors.transparent,
                          tabs: [
                            Tab(
                              child: StoryHeader(),
                              height: 130,
                            ),
                          ],
                        ),
                      ),
                      pinned: false,
                    )
                  : SliverPadding(padding: EdgeInsets.symmetric()),
            ];
          },
          body: pages[index],
        ),
      ),
    );
  }
}

class _SliverContainerDelegate extends SliverPersistentHeaderDelegate {
  _SliverContainerDelegate(this._tabBar);

  final _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverContainerDelegate oldDelegate) {
    return false;
  }
}
