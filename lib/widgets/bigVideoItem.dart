import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app_demo/models/video.dart';
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
      padding: const EdgeInsets.only(top: 5.0),
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
                ),
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
                      style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: 'regular'),
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      'assets/icons/Eye.svg',
                      height: 20,width: 20,
                      color: Colors.white,
                    ),

                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        '${widget.video.watches}',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'light'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0,bottom: 8,left: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, right: 8),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${widget.video.publisher.name}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize:15,fontWeight: FontWeight.w600, )
                              // fontFamily: 'semipop'),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width /1.37,
                          child: Text(
                            '${widget.video.name}',
                              maxLines: 2,
                            style: TextStyle(fontSize:15,fontWeight: FontWeight.w400)//fontFamily: 'regular'),
                          ),
                        ),
                        Container(
                          height: 18,
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
                                        '\#${widget.video.category[index]}',
                                        style: TextStyle(color: Colors.white,fontSize:10,fontFamily: 'light'),
                                      )),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Spacer(),

                    InkWell(
                      onTap: (){},
                      child: SvgPicture.asset(
                        'assets/icons/DotsThreeVertical.svg',
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
