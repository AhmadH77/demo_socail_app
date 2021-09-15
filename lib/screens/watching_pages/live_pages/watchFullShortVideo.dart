import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/liveChatItem.dart';

class WatchFullShortVideo extends StatefulWidget {
  final Video video;

  const WatchFullShortVideo(this.video, {Key? key}) : super(key: key);

  @override
  _WatchFullShortVideoState createState() => _WatchFullShortVideoState();
}

class _WatchFullShortVideoState extends State<WatchFullShortVideo> {
  bool showComments = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/full2.jpg',
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.black),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings_outlined,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.visibility_outlined),
                        Text('100 K')
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.videocam_outlined),
                    )
                  ],
                ),
              ),
              Spacer(
                flex: 2,
              ),
              PhysicalModel(
                color: Colors.transparent,
                shadowColor: Colors.black,
                elevation: 8,
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(50),
                        image: DecorationImage(
                          image: Image.asset(
                            'assets/images/restaurant-5.jpg',
                            fit: BoxFit.cover,
                          ).image,
                        )),
                  ),
                  title: Text(
                    'James Auther',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Exp;salkdsvkmkm;lm kmlk mk m',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('started 30 min ago',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)),
                    ],
                  ),
                ),
              ),
              comments(),
            ],
          ),
        )
      ],
    );
  }

  comments() {
    return Expanded(
      child: Stack(
        fit: StackFit.loose,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
              ),
              child: Container(
                // color: Colors.white.withOpacity(0.2),
                child: PhysicalModel(
                  color: Colors.transparent,
                  shadowColor: showComments ? Colors.black : Colors.transparent,
                  elevation: 8,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          showComments
                              ? Expanded(
                                  child: Container(
                                    height: 100,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      physics: ScrollPhysics(),
                                      itemCount: widget.video.comments.length,
                                      itemBuilder: (context, index) {
                                        return LiveChatItem(
                                            widget.video.comments[index], 1);
                                      },
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icons/DownloadSimple.png',
                        color: Colors.white,
                      )
                      ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: TextDirection.rtl,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.wb_sunny_sharp,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '500 K',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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
                        icon: Icon(
                          showComments
                              ? Icons.comment
                              : Icons.comment_bank_outlined,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '500 K',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          showComments
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
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
              : SizedBox()
        ],
      ),
    );
  }
}
