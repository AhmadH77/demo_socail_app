import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/models/posts.dart';
import 'package:social_app_demo/util/expanded_text.dart';
import 'package:social_app_demo/widget/show_svg_icon.dart';
import 'package:timeago/timeago.dart' as timeAgo;

final DateTime timeStamp = DateTime.now();

class MainPage extends StatefulWidget {
  final set_state;

  const MainPage({Key? key, required this.set_state}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ClampingScrollPhysics(),
      primary: true,
      padding: EdgeInsets.all(0),
      itemBuilder: (context, index) {
        Posts posts = postList[index];

        return buildPost(posts);
      },
      itemCount: postList.length,
      shrinkWrap: true,
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
  Widget buildPost(Posts posts) {
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
                      '@${posts.publisher.name}',
                      style: TextStyle(
                          fontSize: fifteenDp,
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'semipop'),
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
                    iconName: 'assets/svg/BookmarkSimple.svg',
                    color: CupertinoColors.black,
                    onIconTap: () {},
                  ),
                  ShowSvgIcon(
                    iconName: 'assets/svg/DotsThreeVertical.svg',
                    color: CupertinoColors.black,
                    onIconTap: () {},
                  ),
                ],
              ),
            ],
          ),

          //Second row
          buildSecondRow(posts),

          //third row
          buildMenu(),
          //forth row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // width: seventyDp,
                margin: EdgeInsets.only(left: tenDp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //stacked images

                    buildLikedUsersImageWithBorderColor(
                        'assets/images/b.jpg', 10, Colors.red),
                    buildLikedUsersImageWithBorderColor(
                        'assets/images/a.jpg', 10, Colors.amber),
                    buildLikedUsersImageWithBorderColor(
                        'assets/images/b.jpg', 10, Colors.red),
                    buildLikedUsersImageWithBorderColor(
                        'assets/images/b.jpg', 10, Colors.red),
                    buildLikedUsersImageWithBorderColor(
                        'assets/images/b.jpg', 10, Colors.amber),
                    buildLikedUsersImageWithBorderColor(
                        'assets/images/a.jpg', 10, Colors.red),
                  ],
                ),
              ),
              SizedBox(
                width: tenDp,
              ),
              Text.rich(
                TextSpan(
                  style: TextStyle(fontSize: fifteenDp, color: Colors.black),
                  text: '+ ',
                  children: [
                    TextSpan(
                      text: '${posts.numberOfLikes}k others',
                      //todo check number of posts likes
                      style: TextStyle(
                        fontSize: fifteenDp,
                        fontFamily: "regular",
                        color: Colors.black,
                      ),
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
          posts.postImage!.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: tenDp),
                  child: Text(
                    "${posts.postTitle}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: eighteenDp, fontFamily: 'semipop'),
                  ),
                ),
          posts.postImage!.isEmpty
              ? Container()
              : SizedBox(
                  height: eightDp,
                ),
          //sixth row
          posts.postImage!.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: tenDp),
            child: ExpandableText(
                    '${posts.postDescription}',
                    trimLines: 3,
                  ),
                ),

          //view all
          Padding(
            padding: const EdgeInsets.only(left: eightDp, top: sixDp),
            child: Row(
              children: [
                Text('${posts.country} ',
                    style: TextStyle(
                      fontSize: 12,
                      // fontFamily: 'regular',
                      color: Colors.black,
                    )),
                Text(timeAgo.format(posts.timePosted),
                    style: TextStyle(
                      fontSize: 12,
                      // fontFamily: 'regular',
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildImage(image, double radius) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(
          image,
        ),
      ),
    );
  }

  Widget buildLikedUsersImageWithBorderColor(
      image, double radius, Color color) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(twentyDp),
          border: Border.all(color: color, width: 3)),
      // margin: EdgeInsets.symmetric(horizontal: 0.9),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(
          image,
        ),
      ),
    );
  }

  Widget buildLikedImage(image) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image:
              DecorationImage(image: AssetImage("$image"), fit: BoxFit.cover)),
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
            image: AssetImage(image),
          )),
    );
  }

  Widget buildMenu() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: tenDp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(sixDp),
                child: ShowSvgIcon(
                  iconName: 'assets/svg/Fire.svg',
                  color: CupertinoColors.black,
                  onIconTap: () {},
                ),
              ),
              ShowSvgIcon(
                iconName: 'assets/svg/ChatDots.svg',
                color: CupertinoColors.black,
                onIconTap: () {},
              ),
              Padding(
                padding: const EdgeInsets.all(sixDp),
                child: ShowSvgIcon(
                  onIconTap: () {},
                  iconName: 'assets/svg/PaperPlaneRight.svg',
                  color: CupertinoColors.black,
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: sixDp,
                ),
                child: ShowSvgIcon(
                  iconName: 'assets/svg/Trophy.svg',
                  color: CupertinoColors.black,
                  onIconTap: () {},
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildLikedImage('assets/images/b.jpg'),
                    buildLikedImage('assets/images/a.jpg'),
                    buildLikedImage('assets/images/b.jpg'),
                  ],
                ),
              ),
              SizedBox(
                width: 4,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSecondRow(Posts posts) {
    return Stack(
      children: [
        //switch between image and post description
        posts.postImage!.isEmpty
            ? Container(
                margin: EdgeInsets.only(top: sixteenDp),
                //  height: 200,
                decoration:
                    BoxDecoration(color: Colors.amberAccent.withOpacity(0.09)),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: sixteenDp, vertical: tenDp),
                      child: Text('${posts.postTitle}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: sixteenDp,
                        right: sixteenDp,
                        bottom: sixteenDp,
                      ),
                      child: Text('${posts.postDescription}',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: tenDp, fontFamily: 'semipop')),
                    ),
                  ],
                ),
              )
            : Container(
                margin: EdgeInsets.only(top: tenDp),
                child: Image.asset(
                  posts.postImage!,
                  // height: fourFourteenDp,
                  // width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitHeight,
                ),
              ),
        PositionedDirectional(
          start: 100,
          end: 100,
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
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(fontSize: 13),
                      text: ownedBy,
                      children: [
                        TextSpan(
                            text: ' @${posts.ownedBy}',
                            style: TextStyle(
                                fontFamily: "semipop",
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black)),
                      ],
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                buildImage(posts.publisher.image, 14),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
