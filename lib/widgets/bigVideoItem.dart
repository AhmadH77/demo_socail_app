import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/screens/watching_pages/live_pages/watchFullShortVideo.dart';
import 'package:social_app_demo/screens/watching_pages/live_pages/watchVideo.dart';

class BigVideoItem extends StatefulWidget {
  final Video video;

  const BigVideoItem(
    this.video, {
    Key? key,
  }) : super(key: key);

  @override
  _BigVideoItemState createState() => _BigVideoItemState();
}

class _BigVideoItemState extends State<BigVideoItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          pushNewScreen(
            context,
            screen: WatchVideo(widget.video),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => WatchVideo(widget.video)));
        },
        child: HeroMode(
          enabled: true,//tag: 'vedio${widget.video.id}',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(widget.video.image).image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
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
                        '${widget.video.watches}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                    child: PhysicalModel(
                      elevation: 10,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(
                              image: Image.asset(widget.video.publisher.image)
                                  .image,
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.video.publisher.name}',
                        style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${widget.video.name}',
                        style: TextStyle(fontSize:15,),
                      ),
                    ],
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             WatchFullShortVideo(widget.video)));
                      },
                      icon: Icon(Icons.more_vert_outlined)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Container(
                  height: 35,
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemCount: widget.video.category.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          padding: EdgeInsets.only(right: 8, left: 8),
                          // width: 50,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey),
                          child: Center(
                              child: Text(
                            '${widget.video.category[index]}',
                            style: TextStyle(color: Colors.white,fontSize:10,fontWeight: FontWeight.w100),
                          )),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
