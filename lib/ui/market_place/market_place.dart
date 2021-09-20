import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/svg.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/models/posts.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  _MarketPlaceState createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xFF3A9679),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 16),
                    child: SvgPicture.asset(
                      'assets/svg/back.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, top: 20),
                    child: Text(
                      'Market Place',
                      style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Posts post = postList[index];
                  return buildMarketPlace(post);
                },
                itemCount: postList.length,
                shrinkWrap: true,
              )),
        ],
      ),
    );
  }

  //todo to be re implemented
  Widget buildMarketPlace(Posts posts) {
    return ListTile(
      /*leading: CircleAvatar(
        radius: 30,
        child: Image.asset("${posts.likedBy.map((e) => e.image)}"),
      ),*/
      minVerticalPadding: 30,
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage("${posts.publisher.image}"),
      ),
      title: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: fourteenDp, fontWeight: FontWeight.bold),
          text: '@${posts.publisher.name}',
          children: [
            TextSpan(
                text: posts.followers!.isEmpty
                    ? ' started following you'
                    : ' liked your post.',
                style: TextStyle(color: Colors.black54)),
            TextSpan(text: ' 5 m', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
      trailing: posts.followers!.isEmpty
          ? MaterialButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              color: Color(0xFF3A9679),
              child: Text(
                "Follow",
                style: TextStyle(color: Colors.white),
              ),
            )
          : Image.asset("${posts.postImage}"),
    );
  }
}
