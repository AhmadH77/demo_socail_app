import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/screens/shortie_pages/main_pages/fullScreenShortVideo.dart';
import 'package:social_app_demo/screens/watching_pages/live_pages/watchVideo.dart';

class SmallVideoItem extends StatefulWidget {
  final int videoIndex;
  final List<Video> videos;
  final String source;//trending --watching
  const SmallVideoItem(this.videoIndex,this.videos,{Key? key, this.source='watching', }) : super(key: key);

  @override
  _BigVideoItemState createState() => _BigVideoItemState();
}

class _BigVideoItemState extends State<SmallVideoItem> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(bottom: widget.source == 'watching' ? 5 : 0),
      child: InkWell(
        onTap: (){
          pushNewScreen(
            context,
            screen: FullScreenShortVideo(videoIndex: widget.videoIndex,allVideos: widget.videos,),//WatchVideo(widget.video),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
          // Navigator.push(context, MaterialPageRoute(builder: (context) => WatchVideo(widget.video)));
        },
        child: Card(
          elevation: 0,
          margin: EdgeInsets.only(left: 0,right: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: HeroMode(
            enabled: true,//: 'vedio${widget.video.id}',
            child: Container(
              height: 300,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: Image.asset(widget.videos[widget.videoIndex].image).image,
                    fit: BoxFit.cover,
                  )),
              child: widget.videos[widget.videoIndex].live
                  ? Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: TextStyle(color: Colors.white,fontFamily: 'light',fontSize: 11),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                          size: 12,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, bottom: 2),
                          child: Text(
                            widget.videos[widget.videoIndex].watches,
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'light',fontSize: 11),
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
        ),
      ),
    );
  }
}
