import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/commentItem.dart';
import 'package:social_app_demo/widgets/liveChatItem.dart';

class WatchFullShortVideo extends StatefulWidget {
  final Video video;

  const WatchFullShortVideo(this.video, {Key? key}) : super(key: key);

  @override
  _WatchFullShortVideoState createState() => _WatchFullShortVideoState();
}

class _WatchFullShortVideoState extends State<WatchFullShortVideo> {
  bool showComments = false;

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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
              ),
              child: PhysicalModel(
                color: Colors.transparent,
                shadowColor:
                    showComments ? Colors.black : Colors.black.withOpacity(0.5),
                elevation: 8,
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0, left: 10),
                        child: PhysicalModel(
                          color: Colors.transparent,
                          shadowColor: Colors.black,
                          elevation: 8,
                          child: Column(
                            children: [
                              ListTile(
                                leading: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(50),
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
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  'Exp;salkdsvkmkm;lm kmlk mk mxzczjxnc kzxjnckjzxnckjzxnckjxznkcjzxnck',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: showComments
                            ? Container(
                                height: 100,
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  reverse: true,
                                  physics: ScrollPhysics(),
                                  itemCount: widget.video.comments.length,
                                  itemBuilder: (context, index) {
                                    return CommentItem(
                                        widget.video.comments[index], 2);
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
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/DownloadSimple.svg',
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: TextDirection.rtl,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/ThumbsUp.svg',
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
                                  icon:  SvgPicture.asset(
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
                                    style: TextStyle(color: Colors.white),
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
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
