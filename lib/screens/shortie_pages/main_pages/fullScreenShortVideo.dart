import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/screens/mainScreen.dart';
import 'package:social_app_demo/widgets/shortVideoItem.dart';

class FullScreenShortVideo extends StatefulWidget {
  final int videoIndex;
  final List<Video> allVideos;
  const FullScreenShortVideo({Key? key,required this.videoIndex,required this.allVideos}) : super(key: key);

  @override
  _FullScreenShortVideoState createState() => _FullScreenShortVideoState();
}

class _FullScreenShortVideoState extends State<FullScreenShortVideo> {

  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: widget.videoIndex);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // controller.addListener(() {
    //   print('testtest  ${controller.position.pixels}');
    //   if(controller.page == 0)
    //     if(controller.position.userScrollDirection == ScrollDirection.forward)
    //       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen(index: 3,),), (route) => false);
    // });
    return Scaffold(
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: widget.allVideos.map((video) => Stack(
          children: [
            ShortVideoItem(video: video,source: 2,),
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen(index: 3,),), (route) => false);

                      },
                      icon: SvgPicture.asset(
                        'assets/icons/CaretDown.svg',
                        color: Colors.white,
                        height: 100,
                      ),
                    ),
                    IconButton(
                      onPressed: (){
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/Camera.svg',
                        color: Colors.white,
                        height: 100,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )).toList()
      ),
    );
  }

}
