import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/screens/shortie_pages/main_pages/fullScreenShortVideo.dart';
import 'package:social_app_demo/util/const.dart';
import 'package:social_app_demo/widgets/tabs.dart' as tabs;
import 'package:social_app_demo/util/expanded_text.dart';
import 'package:video_player/video_player.dart';

class ShortVideoItem extends StatefulWidget {
  final Video video;
  final int source;

  const ShortVideoItem({Key? key, required this.video, required this.source})
      : super(key: key);

  @override
  _ShortVideoItemState createState() => _ShortVideoItemState();
}

class _ShortVideoItemState extends State<ShortVideoItem>
    with TickerProviderStateMixin {
  bool showComments = false, showReward = false;

  late VideoPlayerController _controller;
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

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        videoPlayerOptions: VideoPlayerOptions());

    // Initialize the controller and store the Future for later use.
    _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(false);
    _controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: '${widget.video.id}',
      child: Material(
        // margin: EdgeInsets.all(0),
        elevation: 0,
        child: Container(
          color: Colors.white30,
          height: widget.source == 2 ? MediaQuery.of(context).size.height : 700,
          // width: MediaQuery.of(context).size.width,
          child: StreamBuilder<Duration?>(
              stream: _controller.position.asStream(),
              builder: (context, snapshot) {
                return GestureDetector(
                    onTap: () {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                      } else {
                        // If the video is paused, play it.
                        _controller.play();
                      }
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // Image.asset(widget.video.image,fit: BoxFit.fill,),
                        _controller.value.isInitialized
                            ? VideoPlayer(
                                _controller,
                              )
                            : Container(
                                color: Colors.black54,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              ),

                        buildVideoInfo(),
                        buildVideoOptions(snapshot.data),
                        showReward ? rewards() : SizedBox(),
                      ],
                    ));
              }),
        ),
      ),
    );
  }

  buildVideoInfo() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: PhysicalModel(
        elevation: 10,
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 20),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 18,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.video.comments.length,
                  itemBuilder: (context, index) {
                    if (index < 2)
                      return Container(
                        margin: EdgeInsets.only(right: 2.0),
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 1, color: Colors.white),
                            image: DecorationImage(
                                image: Image.asset(
                                        widget.video.comments[index].user.image)
                                    .image)),
                      );
                    if (index == 2)
                      return Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Constants.orangeDark),
                        child: Center(
                          child: Text(
                            '+${widget.video.comments.length - 2}',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      );
                    return SizedBox();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 9),
                child: ExpandableText(
                  'The Scene / The Shot / The looks  The Shot / The looks  The Shot / The looks  The Shot / The looks  The Shot / The looks  The Shot / The looks  The Shot / The looks ',
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                '#yoga #foryou #fun #beach #spiritual',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.0),
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(width: 1, color: Colors.white),
                          image: DecorationImage(
                              image: Image.asset(widget.video.publisher.image)
                                  .image)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        '${widget.video.publisher.name}',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {},
                      color: Constants.orangeDark,
                      height: 22,
                      minWidth: 86,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      textColor: Colors.white,
                      child: Text('Follow',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildVideoOptions(duration) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              textDirection: TextDirection.rtl,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      width: 200,
                      height: 20,
                      child: ProgressBar(
                        baseBarColor: Colors.white30,
                        progressBarColor: Colors.white,
                        thumbColor: Colors.white,
                        timeLabelTextStyle:
                            TextStyle(color: Colors.transparent),
                        progress: duration ?? Duration.zero,
                        total: _controller.value.duration,
                        onSeek: (duration) {
                          _controller.seekTo(duration);
                        },
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/svg/Fire.svg',
                      color: Colors.white,
                    )),
                Text(
                  '10K',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Column(
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
                          'assets/icons/ChatDots.svg',
                          color: Colors.white,
                        )
                      : SvgPicture.asset(
                          'assets/icons/ChatDots.svg',
                          color: Colors.white,
                        ),
                ),
                Text(
                  '10K',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: showReward ? Colors.yellow : Colors.transparent),
              child: IconButton(
                color: showReward ? Colors.yellow : Colors.transparent,
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
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.rtl,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/DotsThreeVertical.svg',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/cornerimage.png')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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

  refreshScreen() {
    setState(() {});
  }
}
