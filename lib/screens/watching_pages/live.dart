
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
  final set_state;

  const Live(this.set_state, {Key? key}) : super(key: key);

  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Live> {
  List categories = ['Music', 'Gaming', 'Now','Music', 'Gaming', ];
  List<Video> videos = [
    Video(3, '10 K','Video3', 'test Video', true, 'assets/images/cover.jpg',['Live','Music'],
        User(0, 'publisher3', 'assets/images/rick.jpg'), '1 K' , '200',
        [Comment('comment')]
    ),
    Video(0, '5 K', 'Video1', 'test Video', true, 'assets/images/live1.jpg',['Live','Music'],
        User(1, 'publisher1', 'assets/images/restaurant-5.jpg'), '1 K' , '200',
        [Comment('comment',user: User(0,'user1' , 'assets/images/rick.jpg')),Comment('comment',user: User(1,'user1' , 'assets/images/restaurant-5.jpg')),Comment('comment'),]
    ),
    Video(1, '3 K', 'Video2', 'test Video', true, 'assets/images/live2.jpg',['Live','Music'],
        User(2, 'publisher2', 'assets/images/rick.jpg'), '1 K' , '200',
        [Comment('comment')]
    ),
    Video(2, '9 K', 'Video3', 'test Video', true, 'assets/images/live3.jpg',['Live','Music'],
        User(3, 'publisher3', 'assets/images/restaurant-5.jpg'), '1 K' , '200',
        [Comment('comment')]
    ),
    Video(4, '9 K', 'Video3', 'test Video', true, 'assets/images/live3.jpg',['Live','Music'],
        User(3, 'publisher3', 'assets/images/restaurant-5.jpg'), '1 K' , '200',
        [Comment('comment')]
    ),

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TabBar(

          isScrollable: true,

          indicator: BoxDecoration(
            color: Colors.transparent
          ),
          tabs: categories
              .map((item) => Container(
            width: 154,
                    height: 37,
                    // padding: EdgeInsets.only(top: 10,bottom: 10,left: 20,right: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(child: Text(item , style: TextStyle(fontSize: 18,color:Colors.black,fontFamily: 'regular'),)),
                  ))
              .toList(),
        ),
        body: TabBarView(children: [
          musicPage(),
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
            },)
        ],
      ),
    );
    return CustomScrollView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      controller: controller,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(2.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
                [
                  BigVideoItem(videos[0]),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      left: 15,
                      right: 15,
                    ),
                    child: Text(
                      'hydraflick',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3.6,
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
                    },)
            ],
            ),
          ),
        )
      ],
    );
  }

}
