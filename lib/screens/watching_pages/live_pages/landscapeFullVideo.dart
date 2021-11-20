import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/commentItem.dart';
import 'package:social_app_demo/widgets/tabs.dart' as tabs;

class LandscapeFullVideo extends StatefulWidget {
  final Video video;

  const LandscapeFullVideo(this.video, {Key? key}) : super(key: key);

  @override
  _LandscapeFullVideoState createState() => _LandscapeFullVideoState();
}

class _LandscapeFullVideoState extends State<LandscapeFullVideo>
    with TickerProviderStateMixin {
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
  late AnimationController controller;
  bool showReward = false, startTyping = false, showComments = false;
  TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    controller = BottomSheet.createAnimationController(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/cover.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          videoControl(),
          videoOptions(),
          showReward ? rewards() : SizedBox(),
          showComments ? comments() : SizedBox()
        ],
      ),
    );
  }

  void showComments1() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        builder: (context) {
          return !startTyping
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width / 2,
                      child: ListView.builder(
                        reverse: true,
                        shrinkWrap: true,
                        itemCount: widget.video.comments.length,
                        itemBuilder: (context, index) {
                          return CommentItem(widget.video.comments[index], 2);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 2,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: commentController,
                                onTap: () {
                                  startTyping = true;
                                },
                                cursorColor: Colors.white,
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                    hintText: 'Send a message',
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade500),
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
                                child: CircleAvatar(
                                  // radius: 50,
                                  backgroundColor: Color(0xff94d500),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(Icons.send_outlined),
                                      onPressed: () {},
                                      color: Colors.black,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              : SizedBox();
        });
  }

  refreshScreen() {
    setState(() {});
  }

  videoControl() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/ArrowCounterClockwise.svg',
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/Pause.svg',
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/ArrowClockwise.svg',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  videoOptions() {
    return Align(
      alignment: Alignment.centerRight,
      child: SafeArea(
        child: Column(
          children: [
                 IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/DotsThreeVertical.svg',
                      color: Colors.white,
                    ),
                  ),
            Spacer(),
            //OR
            // !showComments
            //     ? Spacer(): SizedBox(),

            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: showReward ? Colors.yellow : Colors.transparent),
              child: IconButton(
                color: showReward ? Colors.yellow : Colors.transparent,
                onPressed: () {
                  // showRewardDialog();
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
            IconButton(
              onPressed: () {
                // showComments();
                setState(() {
                  showComments = !showComments;
                });
              },
              icon: SvgPicture.asset(
                showComments
                    ? 'assets/icons/comments.svg'
                    : 'assets/icons/noComments.svg',
                color: Colors.white,
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/PaperPlaneRight.svg',
                color: Colors.white,
              ),
            ),
            Spacer(),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/ArrowsIn.svg',
                color: Colors.white,
              ),
            )
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




  comments() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 2,
            child: ListView.builder(
              reverse: true,
              shrinkWrap: true,
              itemCount: widget.video.comments.length,
              itemBuilder: (context, index) {
                return CommentItem(widget.video.comments[index], 2);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width / 2,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onTap: () {
                        startTyping = true;
                      },
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
                      child: CircleAvatar(
                        // radius: 50,
                        backgroundColor: Color(0xff94d500),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.send_outlined),
                            onPressed: () {},
                            color: Colors.black,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
