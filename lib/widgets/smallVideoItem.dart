import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/screens/watching_pages/live_pages/watchVideo.dart';

class SmallVideoItem extends StatefulWidget {
  final Video video;
  const SmallVideoItem(this.video,{Key? key, }) : super(key: key);

  @override
  _BigVideoItemState createState() => _BigVideoItemState();
}

class _BigVideoItemState extends State<SmallVideoItem> {
  @override
  Widget build(BuildContext context) {
    print('vedio${widget.video.id}');
    return  Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: InkWell(
        onTap: (){
          pushNewScreen(
            context,
            screen: WatchVideo(widget.video),
            withNavBar: false, // OPTIONAL VALUE. True by default.
            pageTransitionAnimation: PageTransitionAnimation.cupertino,
          );
          // Navigator.push(context, MaterialPageRoute(builder: (context) => WatchVideo(widget.video)));
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: HeroMode(
            enabled: true,//: 'vedio${widget.video.id}',
            child: Container(
              height: 300,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: Image.asset(widget.video.image).image,
                    fit: BoxFit.cover,
                  )),
              child: widget.video.live
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
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.visibility_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0, bottom: 2),
                          child: Text(
                            widget.video.watches,
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
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
