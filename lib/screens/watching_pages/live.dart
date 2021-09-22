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
  const Live({Key? key}) : super(key: key);

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
        '10 K',
        'Göra Frihetsgudinnan i Minecraft | LIVE',
        'test Video',
        true,
        'assets/images/cover.jpg',
        ['Live', 'Music'],
        User(0, 'Zombie_500', 'assets/images/rick.jpg'),
        '1 K',
        '200',
        [
          Comment(
              'Jag målar inte drömmar eller mardrömmar, jag målar min egen verklighet',
              user: User(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
    Video(
        0,
        '5 K',
        'Liquid vs NIP | ESL Pro League | LIVE ',
        "Everyday brings new opportunitites, so in esports. Here with the best teams will fight for their survivals in the tournament. ",
        true,
        'assets/images/live1.jpg',
        ['Live', 'Music'],
        User(1, 'ESL_CSGO', 'assets/images/restaurant-5.jpg'),
        '1 K',
        '200',
        [
          Comment(
              'En målning för mig är i första hand ett verb, inte ett substantiv, en händelse först och bara i andra hand en bild',
              user: User(0, 'user1', 'assets/images/rick.jpg')),
          Comment(
              'Jag målar inte drömmar eller mardrömmar, jag målar min egen verklighet',
              user: User(1, 'user1', 'assets/images/restaurant-5.jpg')),
          Comment('comment',
              user: User(0, 'user1', 'assets/images/restaurant-5.jpg')),
        ]),
    Video(
        1,
        '3 K',
        'Video2',
        'test Video',
        true,
        'assets/images/live2.jpg',
        ['Live', 'Music'],
        User(2, 'publisher2', 'assets/images/rick.jpg'),
        '1 K',
        '200',
        [
          Comment('comment',
              user: User(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
    Video(
        2,
        '9 K',
        'Video3',
        'test Video',
        true,
        'assets/images/live3.jpg',
        ['Live', 'Music'],
        User(3, 'publisher3', 'assets/images/restaurant-5.jpg'),
        '1 K',
        '200',
        [
          Comment('comment',
              user: User(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
    Video(
        4,
        '9 K',
        'Video3',
        'test Video',
        true,
        'assets/images/live3.jpg',
        ['Live', 'Music'],
        User(3, 'publisher3', 'assets/images/restaurant-5.jpg'),
        '1 K',
        '200',
        [
          Comment('comment',
              user: User(0, 'user1', 'assets/images/restaurant-5.jpg'))
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
    });
  }

  @override
  Widget build(BuildContext context) {
    print('live');
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TabBar(
          isScrollable: true,
          indicator: BoxDecoration(color: Colors.transparent),
          tabs: categories
              .map((item) => Padding(
                    padding: EdgeInsets.only(
                        left: item == categories[0] ? 8 : 0, right: 12),
                    child: Container(
                      // width: 72,
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
                return SmallVideoItem(videos[index + 1]);
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
