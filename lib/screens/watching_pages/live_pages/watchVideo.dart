import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/screens/watching_pages/live_pages/watchFullShortVideo.dart';
import 'package:social_app_demo/util/const.dart';
import 'package:social_app_demo/widgets/bigVideoItem.dart';
import 'package:social_app_demo/widgets/liveChatItem.dart';

import 'landscapeFullVideo.dart';

class WatchVideo extends StatefulWidget {
  final Video video;

  const WatchVideo(this.video, {Key? key}) : super(key: key);

  @override
  _WatchVideoState createState() => _WatchVideoState();
}

class _WatchVideoState extends State<WatchVideo> with TickerProviderStateMixin {
  List<Video> videos = [
    Video(
        0,
        '5 K',
        'Video1',
        'test Video',
        true,
        'assets/images/live1.jpg',
        ['Live', 'Music'],
        User(1, 'publisher1', 'assets/images/restaurant-5.jpg'),
        '1 K',
        '200',
        [
          Comment('comment', user: User(0, 'user1', 'assets/images/rick.jpg')),
          Comment('comment',
              user: User(1, 'user1', 'assets/images/restaurant-5.jpg')),
          Comment('comment'),
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
        [Comment('comment')]),
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
        [Comment('comment')]),
  ];
  int pageIndex = 0;
  late TabController tabController;
  List currencyList = [
    '\$ 5',
    '\$ 10',
    '\$ 50',
    '\$ 100',
    '\$ 150',
    '\$ 200',
    '\$ 250',
    '\$ 300',
    '\$ 350'
  ];
  int currencyTabIndex = 0, selected = 0;
  bool showDescription = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    print( 'video${widget.video.id}');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            HeroMode(
              enabled: true,//tag: 'video${widget.video.id}',
              child: Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 8),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: Image.asset(widget.video.image).image,
                  fit: BoxFit.cover,
                )),
                child: widget.video.live
                    ? Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child:  SvgPicture.asset(
                                    'assets/icons/Eye.svg',
                                    height: 20,width: 20,
                                    color: Colors.white,
                                  ),

                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.0, bottom: 2),
                                  child: Text(
                                    '${widget.video.watches} viewers',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            // Spacer(),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LandscapeFullVideo(widget.video)));
                                  },
                                  child:  SvgPicture.asset(
                                    'assets/icons/ArrowsIn.svg',
                                    height: 20,width: 20,
                                    color: Colors.white,
                                  ),

                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WatchFullShortVideo(widget.video)));
                                  },
                                  child:  SvgPicture.asset(
                                    'assets/icons/FrameCorners.svg',
                                    height: 20,width: 20,
                                    color: Colors.white,
                                  ),


                                ),
                              ],
                            ),

                          ],
                        ),
                      )
                    : SizedBox(),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: PhysicalModel(
                            elevation: 10,
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(60),
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: Image.asset(
                                            widget.video.publisher.image)
                                        .image,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        //
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.video.publisher.name}',
                                style: TextStyle(fontSize:15,fontWeight: FontWeight.bold,fontFamily: 'semipop'),
                              ),
                              Text(
                                '${widget.video.name}',
                                style: TextStyle(fontSize:15,fontFamily: 'regular'),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                height: 30,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: ScrollPhysics(),
                                  itemCount: widget.video.category.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey),
                                        child: Center(
                                            child: Text(
                                          '${widget.video.category[index]}',
                                              style: TextStyle(color: Colors.white,fontSize:10,fontFamily: 'light'),
                                        )),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                        //
                        Spacer(),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  right: 8, left: 8, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Constants.orangeDark,
                              ),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/LightningBlack.svg',
                                  ),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () {
                                    setState(() {
                                      showDescription = !showDescription;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: showDescription
                                        ?   SvgPicture.asset(
                                      'assets/icons/‏‏CaretUp.svg',
                                    )
                                        : SvgPicture.asset(
                                      'assets/icons/CaretDown.svg',
                                    )

                                        // Icon(Icons.keyboard_arrow_down_rounded),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  showDescription
                      ? description()
                       : videoOptions(),
                  !showDescription
                    ?(pageIndex == 1 ? comments() : otherVideos())
                  :SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  comments() {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 40.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(
                            avatar: Icon(
                              Icons.circle,
                              color: Colors.red,
                            ),
                            backgroundColor:
                                Colors.pinkAccent.shade100.withOpacity(0.3),
                            label: Text('\$ 200 '),
                          ),
                        );
                      },
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: widget.video.comments.length,
                    itemBuilder: (context, index) {
                      return LiveChatItem(widget.video.comments[index], 0);
                    },
                  ),
                ],
              ),
            ),
          ),
          commentText()
        ],
      ),
    );
  }

  otherVideos() {
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return BigVideoItem(videos[index]);
        },
      ),
    );
  }

  void showRewardDialog() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12, top: 20, bottom: 50),
                    child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: false,
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)),
                        controller: tabController,
                        tabs: [
                          Tab(
                            child: InkWell(
                              onTap: () {
                                setState.call(() {
                                  tabController.index = 0;
                                  currencyTabIndex = 0;
                                });
                                refreshScreen();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: tabController.index == 1
                                        ? Border.all(color: Colors.black)
                                        : Border.all(color: Colors.white)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          'assets/icons/Money.svg',

                                          color: Colors.grey,
                                        ),
                                        SizedBox(width: 5,),
                                        Text('Currency',
                                          style: TextStyle(color: Colors.grey),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Tab(
                              child: InkWell(
                            onTap: () {
                              refreshScreen();
                              setState.call((){
                                print('tttttt  $currencyTabIndex');
                                tabController.index = 1;
                                currencyTabIndex = 0;
                                print('tttttt  $currencyTabIndex');
                              });
                              refreshScreen();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: tabController.index == 0
                                      ? Border.all(color: Colors.black)
                                      : Border.all(color: Colors.white)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Trophy.svg',

                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 5,),
                                      Text('Rewards',style: TextStyle(color: Colors.grey),)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ))
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          currencyTabIndex == 0
                              ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      child: GridView.builder(
                                        padding: EdgeInsets.all(10),
                                        itemCount: currencyList.length,
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 2.5,
                                          crossAxisSpacing: 15,
                                          mainAxisSpacing: 30,
                                        ),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              setState.call(() {
                                                selected = index;
                                              });
                                            },
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              color: selected == index
                                                  ? Colors.grey
                                                  : Colors.white,
                                              child: Center(
                                                child:
                                                    Text(currencyList[index]),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                          onPressed: () {
                                            setState.call(() {
                                              currencyTabIndex = 1;
                                            });
                                          },
                                          child: Text(
                                            'Enter Amount',
                                            style:
                                                TextStyle(color: Colors.yellow),
                                          )),
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      currencyList[selected],
                                      style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    ElevatedButton(
                                        style: ButtonStyle(
                                            padding: MaterialStateProperty.all(
                                                EdgeInsets.only(
                                                    top: 20,
                                                    bottom: 20,
                                                    left: 50,
                                                    right: 50)),
                                            side: MaterialStateProperty.all(
                                                BorderSide(
                                                    color: Colors.black)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)))),
                                        onPressed: () {},
                                        child: Text(
                                          'Confirm',
                                        )),
                                  ],
                                ),
                          Center(child: Text('test')),
                        ]),
                  )
                ],
              );
            },
          );
        });
  }


  refreshScreen(){
    setState(() {
    });
  }

  videoOptions() {
    return  Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 10.0,right: 10),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon:SvgPicture.asset(
                          'assets/svg/Fire.svg',
                          color: Colors.black,
                        )
                      // Icon(Icons.thumb_down_alt_outlined),
                    ),
                    Text('${widget.video.likes}',style: TextStyle(fontFamily: 'regular'))
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 10.0,right: 10),
                child: Column(
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            pageIndex = 1;
                          });
                        },
                        icon: pageIndex == 1
                            ?  SvgPicture.asset(
                          'assets/icons/Chats-1.svg',
                          color: Colors.black,
                        )
                            : SvgPicture.asset(
                          'assets/icons/Chats.svg',
                          color: Colors.black,
                        )

                    ),
                    Text('Live Chat',style: TextStyle(fontFamily: 'regular'))
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 10.0,right: 10),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/Megaphone.svg',
                        color: Colors.black,
                      ),

                    ),
                    Text('Report',style: TextStyle(fontFamily: 'regular'),)
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/DotsThreeVertical.svg',
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  commentText() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(8),
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                cursorColor: Colors.white,
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                    hintText: 'Send a message',
                    hintStyle: TextStyle(color: Colors.grey.shade500),
                    fillColor: Colors.grey.shade300,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                onTap: () {
                  showRewardDialog();
                },
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(
                      'assets/icons/Crown.svg',
                      color: Colors.black,
                    ),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(
                      'assets/icons/Smiley.svg',
                      color: Colors.black,
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  description() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Text('Description', style: TextStyle(fontSize: 18,),),
            SizedBox(height: 10,),
            Text('${widget.video.name}',style: TextStyle(fontSize: 15,fontFamily: 'semipop')),
            SizedBox(height: 5,),
            Text('10 September 2021',style: TextStyle(fontFamily: 'light')),
            SizedBox(height: 15,),
            Text('Description Description Description',style: TextStyle(fontFamily: 'regular'),),
          ],
        ),
      ),
    );
  }

}
