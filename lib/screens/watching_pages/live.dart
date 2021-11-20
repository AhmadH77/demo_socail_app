import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/bigVideoItem.dart';
import 'package:social_app_demo/widgets/smallVideoItem.dart';
// import 'package:social_app_demo/widgets/tabBar.dart' as tab;

class Live extends StatefulWidget {
   final ScrollController basePageScrollController;
  const Live({Key? key,  required this.basePageScrollController}) : super(key: key);

  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  List categories = [
    'Music',
    'Gaming',
    'Now',
    'Music Now',
    'Gaming',
  ];
  List<Video> videos = [
    Video(
        3,
        '10K',
        'Göra Frihetsgudinnan i Minecraft | LIVE',
        'test Video',
        true,
        'assets/images/cover.jpg',
        ['Live', 'Music'],
        UserModel(0, 'Zombie_500', 'assets/images/rick.jpg'),
        '1K',
        '200',
        [
          Comment(
              'Jag målar inte drömmar eller mardrömmar, jag målar min egen verklighet',
              user: UserModel(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
    Video(
        0,
        '5K',
        'Liquid vs NIP | ESL Pro League | LIVE ',
        "Everyday brings new opportunitites, so in esports. Here with the best teams will fight for their survivals in the tournament. ",
        true,
        'assets/images/live1.jpg',
        ['Live', 'Music'],
        UserModel(1, 'ESL_CSGO', 'assets/images/restaurant-5.jpg'),
        '1K',
        '200',
        [
          Comment(
              'En målning för mig är i första hand ett verb, inte ett substantiv, en händelse först och bara i andra hand en bild',
              user: UserModel(0, 'user1', 'assets/images/rick.jpg')),
          Comment(
              'Jag målar inte drömmar eller mardrömmar, jag målar min egen verklighet',
              user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
          Comment('comment',
              user: UserModel(0, 'user1', 'assets/images/restaurant-5.jpg')),
        ]),
    Video(
        1,
        '3K',
        'Video2',
        'test Video',
        true,
        'assets/images/live2.jpg',
        ['Live', 'Music'],
        UserModel(2, 'publisher2', 'assets/images/rick.jpg'),
        '1K',
        '200',
        [
          Comment('comment',
              user: UserModel(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
    Video(
        2,
        '9K',
        'Video3',
        'test Video',
        true,
        'assets/images/live3.jpg',
        ['Live', 'Music'],
        UserModel(3, 'publisher3', 'assets/images/restaurant-5.jpg'),
        '1K',
        '200',
        [
          Comment('comment',
              user: UserModel(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
    Video(
        4,
        '9K',
        'Video3',
        'test Video',
        true,
        'assets/images/live3.jpg',
        ['Live', 'Music'],
        UserModel(3, 'publisher3', 'assets/images/restaurant-5.jpg'),
        '1K',
        '200',
        [
          Comment('comment',
              user: UserModel(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
  ];
  ScrollController controller = ScrollController();
  var _isVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isVisible = true;
    controller = new ScrollController();
    controller.addListener(() {
      if (controller.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            print('vvvvs $_isVisible');
            _isVisible = false;
          });
        }
      } else {
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            setState(() {
              print('vvvvs $_isVisible');

              _isVisible = true;
            });
          }
        }
      }
    });
    widget.basePageScrollController.addListener(() {
      print('offset  ${widget.basePageScrollController.offset}');
      if (widget.basePageScrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isVisible == true) {
          setState(() {
            _isVisible = false;
          });
        }
      } else {
        if (widget.basePageScrollController.position.userScrollDirection ==
            ScrollDirection.forward) {
          if (_isVisible == false) {
            setState(() {
              _isVisible = true;
            });
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('live');
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar:  PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width , 30),
          child: Visibility(
            visible: _isVisible,
            child: TabBar(
              padding: EdgeInsets.zero,
              isScrollable: true,
              indicator: BoxDecoration(color: Colors.transparent),
              tabs: categories
                  .map((item) => Tab(

                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        item,
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontFamily: 'regular'),
                      )),
                    ),
                  ))
                  .toList(),
            ),
          ),
        ),
        body: TabBarView(children: [
          musicPage(),
          // Container(
          //   height: 100,
          //   child: Center(
          //     child: Text(categories[1]),
          //   ),
          // ),
          Container(
            height: 100,
            child: Center(
              child: Text(categories[1]),
            ),
          ),
          Container(
            height: 100,
            child: Center(
              child: Text(categories[2]),
            ),
          ),
          Container(
            height: 100,
            child: Center(
              child: Text(categories[2]),
            ),
          ),
          Container(
            height: 100,
            child: Center(
              child: Text(categories[2]),
            ),
          ),
        ]),
      ),
    );
  }

  musicPage() {
    print('live1');

    return SingleChildScrollView(
      child: Column(
        children: [
          BigVideoItem(videos[0]),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemCount: videos.length - 1,
              itemBuilder: (context, index) {
                return SmallVideoItem(index + 1,videos,source: 'watching',);
              },
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: videos.length,
            itemBuilder: (context, index) {
              return BigVideoItem(videos[index]);
            },
          )
        ],
      ),
    );
  }

}
