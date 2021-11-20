import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/commentItem.dart';
import 'package:social_app_demo/widgets/tabs.dart' as tabs;
import 'package:video_player/video_player.dart';

class WatchFullShortVideo extends StatefulWidget {
  final Video video;

  const WatchFullShortVideo(this.video, {Key? key}) : super(key: key);

  @override
  _WatchFullShortVideoState createState() => _WatchFullShortVideoState();
}

class _WatchFullShortVideoState extends State<WatchFullShortVideo>
    with TickerProviderStateMixin {
  bool showComments = false, showReward = false;
  late TabController tabController;
  int currencyTabIndex = 0, selected = 0;
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

  late VideoPlayerController _controller;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('tttttt');
    return Stack(
      children: [
        // Image.asset(
        //   'assets/images/full2.jpg',
        //   height: MediaQuery.of(context).size.height,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/CaretDown.svg',
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(widget.video.name),
          ),
          body: comments(),
        )
      ],
    );
  }

  comments() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Stack(
        fit: StackFit.loose,
        children: [

          showReward ? rewards() : SizedBox(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 50.0,
              ),
              child: PhysicalModel(
                color: Colors.transparent,
                shadowColor: showComments
                    ? Colors.black
                    : Colors.black.withOpacity(0.5),
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 20.0, left: 10),
                      //   child: PhysicalModel(
                      //     color: Colors.transparent,
                      //     shadowColor: Colors.black,
                      //     elevation: 8,
                      //     child: Column(
                      //       children: [
                      //         ListTile(
                      //           leading: Container(
                      //             height: 30,
                      //             width: 30,
                      //             decoration: BoxDecoration(
                      //                 borderRadius:
                      //                     BorderRadiusDirectional.circular(50),
                      //                 image: DecorationImage(
                      //                   image: Image.asset(
                      //                     'assets/images/restaurant-5.jpg',
                      //                     fit: BoxFit.cover,
                      //                   ).image,
                      //                 )),
                      //           ),
                      //           title: Text(
                      //             'James Auther',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //         Container(
                      //           width: MediaQuery.of(context).size.width / 1.5,
                      //           child: Text(
                      //             'Exp;salkdsvkmkm;lm kmlk mk mxzczjxnc kzxjnckjzxnckjzxnckjxznkcjzxnck',
                      //             style: TextStyle(color: Colors.white),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: showComments
                            ? Container(
                          height: MediaQuery.of(context)
                              .size
                              .height /
                              2,
                          width: MediaQuery.of(context)
                              .size
                              .width /
                              1.2,
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            physics: ScrollPhysics(),
                            itemCount: widget
                                .video.comments.length,
                            itemBuilder: (context, index) {
                              return CommentItem(
                                  widget.video
                                      .comments[index],
                                  2);
                            },
                          ),
                        )
                            : SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: showReward
                            ? Colors.yellow
                            : Colors.transparent),
                    child: IconButton(
                      color: showReward
                          ? Colors.yellow
                          : Colors.transparent,
                      onPressed: () {
                        setState(() {
                          showReward = !showReward;
                        });
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/Trophy.svg',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    textDirection: TextDirection.rtl,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            showComments = !showComments;
                          });
                        },
                        icon: showComments
                            ? SvgPicture.asset(
                          'assets/icons/comments.svg',
                          color: Colors.white,
                        )
                            : SvgPicture.asset(
                          'assets/icons/noComments.svg',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: TextDirection.rtl,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/PaperPlaneRight.svg',
                          color: Colors.white,
                        ),
                      ),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      // Text(
                      //   '500 K',
                      //   style: TextStyle(color: Colors.white),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          showComments
              ? Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      cursorColor: Colors.white,
                      textAlignVertical:
                      TextAlignVertical.bottom,
                      decoration: InputDecoration(
                          hintText: 'Send a message',
                          hintStyle: TextStyle(
                              color: Colors.grey.shade500),
                          fillColor: Colors.grey.shade300,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1)),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.circular(30),
                              borderSide: BorderSide(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1))),
                    ),
                  ),
                  Padding(
                      padding:
                      const EdgeInsets.only(left: 8.0),
                      child: CircleAvatar(
                        // radius: 50,
                        backgroundColor: Color(0xff94d500),
                        child: Center(
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/PaperPlaneRight.svg',
                              color: Colors.white,
                            ),
                            onPressed: () {},
                            color: Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          )
              : Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  widget.video.live
                      ? Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.red,
                        size: 15,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        'Live',
                        style: TextStyle(
                            color: Colors.white),
                      ),
                    ],
                  )
                      : SizedBox(),
                  SizedBox(
                    width: 10,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/Eye.svg',
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '100 K',
                        style:
                        TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }

  refreshScreen() {
    setState(() {});
  }

  rewards() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 40.0),
        child: Container(
          height: 500,
          padding: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12, top: 20, bottom: 50),
                child: Container(
                  color: Colors.yellow,
                  width: 300,
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      isScrollable: false,
                      indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      controller: tabController,
                      tabs: [
                        tabs.Tab(
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/Money.svg',
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Currency',
                                        style: TextStyle(color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        tabs.Tab(
                            child: InkWell(
                          onTap: () {
                            print('tttttt  $currencyTabIndex');
                            tabController.index = 1;
                            currencyTabIndex = 0;
                            print('tttttt  $currencyTabIndex');
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
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Rewards',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ))
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.yellow,
                  width: 300,
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
                                                    BorderRadius.circular(10)),
                                            color: selected == index
                                                ? Colors.grey
                                                : Colors.white,
                                            child: Center(
                                              child: Text(currencyList[index]),
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
                                              BorderSide(color: Colors.black)),
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
                                        style: TextStyle(color: Colors.black),
                                      )),
                                ],
                              ),
                        Center(child: Text('test')),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
