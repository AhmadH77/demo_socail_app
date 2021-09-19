import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/tabBar.dart' as tab;

class Trending extends StatefulWidget {
  final set_state;

  const Trending(this.set_state, {Key? key}) : super(key: key);

  @override
  _LiveState createState() => _LiveState();
}

class _LiveState extends State<Trending> with TickerProviderStateMixin {
  List categories = ['Trend', 'PSG', 'News'];
  List<Video> videos = [
    Video(0, '-', 'Vido1', 'test Video', false, 'assets/images/live1.jpg',['Trending','Trend'],User(0, 'publisher3', 'assets/images/rick.jpg'), '1 K' , '200', [Comment('comment')]),
    Video(1, '-', 'Vido2', 'test Video', false, 'assets/images/live2.jpg',['Trending','Trend'],User(1, 'publisher1', 'assets/images/restaurant-5.jpg'), '1 K' , '200',
        [
          Comment('comment'),
          Comment('comment'),
          Comment('comment'),
          Comment('comment',user: User(0,'user1' , 'assets/images/rick.jpg')),
        ]),
    Video(2, '-', 'Vido3', 'test Video', false, 'assets/images/live3.jpg',['Trending','Trend'],User(2, 'publisher2', 'assets/images/rick.jpg'), '1 K' , '200',[Comment('test')]),
  ];
  late TabController tabController;
  ScrollController controller = ScrollController();
  var _isVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: videos.length, vsync: this);
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
      length: 3,
      child: Scaffold(
        appBar: tab.TabBar(
          controller: tabController,
          indicatorSize: tab.TabBarIndicatorSize.label,
          indicator: BubbleTabIndicator(
              padding: EdgeInsets.all(10),
              indicatorColor: Colors.grey.shade400),
          tabs: categories
              .map((item) => Container(
                    padding: EdgeInsets.all(10),
                    // margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(item),
                  ))
              .toList(),
        ),
        body: tab.TabBarView(controller: tabController, children: [
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
        ]),
      ),
    );
  }

  musicPage() {
    return CustomScrollView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      controller: controller,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Container(
                  height: MediaQuery.of(context).size.height / 3.6,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      return smallVideoItem(videos[index]);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 200,
                  // width: 400,
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: Image.asset('assets/images/cover.jpg').image,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 8),
                child: SizedBox(
                  height: 1,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 8),
                child: SizedBox(
                  height: 1,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 15.0, right: MediaQuery.of(context).size.width / 2),
                child: SizedBox(
                  height: 1,
                  child: Container(
                    color: Colors.black,
                  ),
                ),
              )
            ]),
          ),
        )
      ],
    );
  }

  smallVideoItem(Video video) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: Image.asset(video.image).image,
              fit: BoxFit.cover,
            )),
        child: video.live
            ? Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 15,
                    ),
                    Text(
                      'Live',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(
                      Icons.visibility_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.0, bottom: 2),
                      child: Text(
                        video.watches,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox(),
      ),
    );
  }
}
