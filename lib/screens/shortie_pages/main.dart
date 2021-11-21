import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/shortVideoItem.dart';

import 'main_pages/fullScreenShortVideo.dart';

class Main extends StatefulWidget {
  final ScrollController? basePageScrollController;
  const Main({Key? key, this.basePageScrollController}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  List<Video> videos = [
    Video(
        3,
        '10K',
        'Göra Frihetsgudinnan i Minecraft | LIVE',
        'test Video',
        true,
        'assets/images/liveshort1.png',
        ['Live', 'Music'],
        UserModel(0, 'Zombie_500', 'assets/images/rick.jpg'),
        '1K',
        '200',
        [
          Comment(
              'Jag målar inte drömmar eller mardrömmar, jag målar min egen verklighet',
              user: UserModel(0, 'user1', 'assets/images/restaurant-5.jpg'))
        ]),
    Video(
        0,
        '5K',
        'Liquid vs NIP | ESL Pro League | LIVE ',
        "Everyday brings new opportunitites, so in esports. Here with the best teams will fight for their survivals in the tournament. ",
        true,
        'assets/images/liveshort2.png',
        ['Live', 'Music'],
        UserModel(1, 'ESL_CSGO', 'assets/images/restaurant-5.jpg'),
        '1K',
        '200',
        [
          Comment(
              'En målning för mig är i första hand ett verb, inte ett substantiv, en händelse först och bara i andra hand en bild',
              user: UserModel(0, 'user1', 'assets/images/rick.jpg')),
          Comment(
              'Jag målar inte drömmar eller mardrömmar, jag målar min egen verklighet',
              user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
          Comment('comment',
              user: UserModel(0, 'user1', 'assets/images/restaurant-5.jpg')),
          Comment(
              'Jag målar inte drömmar eller mardrömmar,',
              user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
        ]),

  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.basePageScrollController!.addListener(() {
      print('offset331eee  ${widget.basePageScrollController!.position.userScrollDirection}');

      if(widget.basePageScrollController!.position.userScrollDirection ==ScrollDirection.reverse
          && widget.basePageScrollController!.offset > 70) {
        print('yeah');
        // Navigator.push
        pushNewScreen(
          context,
          screen: FullScreenShortVideo(videoIndex: 0,allVideos:videos),
          withNavBar: false, // OPTIONAL VALUE. True by default.
          pageTransitionAnimation: PageTransitionAnimation.slideUp,
        );
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light
    ));
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        children: [
          InkWell(
              onTap: (){
                // pushNewScreen(
                //   context,
                //   screen: FullScreenShortVideo(video: videos[index]),
                //   withNavBar: false, // OPTIONAL VALUE. True by default.
                //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                // );
                // Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreenShortVideo(video: widget.video),));

              },
              child: ShortVideoItem(video: videos[0],source: 1,)),
        ],
      ),
    );
  }

}
