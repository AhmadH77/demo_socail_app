import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/constants/theme_color.dart';
import 'package:social_app_demo/widget/show_icons.dart';
import 'package:social_app_demo/widget/show_svg_icon.dart';

class MainPage extends StatefulWidget {
  final set_state;

  const MainPage({Key? key, required this.set_state}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              buildYourStory(),
              buildBuildDiscoverCreators(),
              buildStories(Colors.lightBlue, 'jonasnaah'),
              buildStories(Colors.deepPurpleAccent, 'tweetasm'),
              buildStories(Colors.deepPurpleAccent, 'jonasnaah'),
              buildStories(Colors.deepPurpleAccent, 'tweetasm'),
              buildStories(Colors.deepPurpleAccent, 'jonasnaah'),
              buildStories(Colors.deepPurpleAccent, 'tweetasm'),
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          physics: ClampingScrollPhysics(),
          primary: true,
          padding: EdgeInsets.all(0),
          itemBuilder: (context, index) {
            return buildContent();
          },
          itemCount: 10000,
          shrinkWrap: true,
        ))
      ],
    );
  }

  Widget buildYourStory() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: sixteenDp, left: sixteenDp, right: tenDp),
              height: hundredDp,
              width: hundredDp,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(thirtySixDp),
              ),
            ),
            Positioned(
              top: eightyDp,
              left: ninetyDp,
              child: Container(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                height: thirtySixDp,
                width: thirtySixDp,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(twentyDp)),
              ),
            ),
          ],
        ),
        Text(yourStory),
      ],
    );
  }

  Widget buildBuildDiscoverCreators() {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
                right: sixteenDp,
                left: tenDp,
              ),
              height: eightyDp,
              width: eightyDp,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(thirtyDp),
              ),
            ),
            Positioned(
              top: twentyDp,
              child: Container(
                height: thirtyDp,
                width: thirtyDp,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(twentyDp)),
              ),
            ),
            Positioned(
              top: eightyDp,
              left: seventyDp,
              child: Container(
                height: thirtyDp,
                width: thirtyDp,
                decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(twentyDp)),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(discoverCreators),
        ),
      ],
    );
  }

  Widget buildStories(Color color, name) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: sixteenDp, right: tenDp),
          height: hundredDp,
          width: hundredDp,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(thirtySixDp),
          ),
        ),
        Text(name),
      ],
    );
  }

  //contains user name , images and menus
  Widget buildContent() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //first row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  buildUserImage('assets/images/a.jpg'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '@redbullracing',
                      style: TextStyle(
                          fontSize: twentyDp, fontWeight: FontWeight.w500),
                    ),
                  ),
                  /*Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: eighteenDp),
                          text: ownedBy,
                          children: [
                            TextSpan(
                                text: ' @abcd',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      )
                    ],
                  )*/
                ],
              ),
              Row(
                children: [
                  ShowSvgIcon(
                    iconName: 'assets/svg/BookmarkSimple.svg',color: CupertinoColors.black,
                    onIconTap: () {},
                  ),
                  ShowSvgIcon(
                    iconName: 'assets/svg/DotsThreeVertical.svg',color: CupertinoColors.black,
                    onIconTap: () {},
                  ),
                ],
              ),
            ],
          ),

          //Second row
          buildSecondRow(),

          //third row
          buildMenu(),
          //forth row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: seventyDp,
                margin: EdgeInsets.only(left: tenDp),
                child: Stack(
                  children: [
                    //stacked images

                    Positioned(
                        child: buildImage('assets/images/b.jpg'), left: 36),
                    Positioned(
                        child: buildImage('assets/images/a.jpg'), left: 26),
                    Positioned(
                        child: buildImage('assets/images/b.jpg'), left: 14),
                    buildImage('assets/images/a.jpg'),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: fourteenDp),
                  text: likedBy,
                  children: [
                    TextSpan(
                        text: ' 10,223,355',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: ' $others',
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: fourDp,
          ),
          //fifth row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: tenDp),
            child: Text(
              dummy,
              style:
              TextStyle(fontSize: eighteenDp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: eightDp,
          ),
          //sixth row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: tenDp),
            child: Text(
              dummyDes,
              style: TextStyle(fontSize: twentyDp, color: ThemeColors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(image) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: CircleAvatar(
        radius: 14,
        backgroundImage: AssetImage(
          image,
        ),
      ),
    );
  }

  Widget buildUserImage(image) {
    return Container(
      margin: EdgeInsets.only(left: sixteenDp),
      width: thirtyThreeDp,
      height: thirtyThreeDp,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(thirtyDp),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('$image'),
          )),
    );
  }

  Widget buildMenu() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(sixDp),
              child: ShowSvgIcon(
                iconName: 'assets/svg/Fire.svg',color: CupertinoColors.black,
                onIconTap: () {},
              ),
            ),
            ShowSvgIcon(
              iconName: 'assets/svg/ChatDots.svg',color: CupertinoColors.black,
              onIconTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(sixDp),
              child: ShowSvgIcon(
                onIconTap: () {},
                iconName: 'assets/svg/PaperPlaneRight.svg',color: CupertinoColors.black,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(sixDp),
          child: ShowSvgIcon(
            iconName: 'assets/svg/Trophy.svg',color: CupertinoColors.black,
            onIconTap: () {},
          ),
        ),
      ],
    );
  }

  Widget buildSecondRow() {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: tenDp),
          child: Image.asset(
            'assets/images/b.jpg',
            // height: fourFourteenDp,
            // width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
          ),
        ),
        PositionedDirectional(
          start: oneTwentyDp,
          end: oneTwentyDp,
          top: 0,
          child: Container(
            height: twentySixdp,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [Colors.lightGreenAccent, Colors.tealAccent]),
                borderRadius: BorderRadius.circular(thirtyTwoDp)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(left: eightDp),
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(fontSize: fourteenDp),
                        text: ownedBy,
                        children: [
                          TextSpan(
                              text: ' @abbcd ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                buildImage('assets/images/a.jpg'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
