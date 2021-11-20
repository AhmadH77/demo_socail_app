import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/provider/currentPage.dart';
import 'package:social_app_demo/screens/live_strem.dart';
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

    pages = [Live(basePageScrollController: controller,), Explorer(), Explorer()];//Trending(widget.set_state)
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
      }
      else {
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
      resizeToAvoidBottomInset: true,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LiveStream(isBroadcaster: true,),));
          }, child: Text('Broadcast')),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => LiveStream(isBroadcaster: false,),));

          }, child: Text('view')),
          Container(
            child:
              Text('test3'),
          ),
        ],
      ),
    );

  }
}
