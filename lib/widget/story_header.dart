import 'package:flutter/material.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';

//todo this class is not dynamic for fetching data
class StoryHeader extends StatefulWidget {
  const StoryHeader({Key? key}) : super(key: key);

  @override
  _StoryHeaderState createState() => _StoryHeaderState();
}

class _StoryHeaderState extends State<StoryHeader> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
        Text(yourStory, style: TextStyle(color: Colors.black)),
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
          child: Text(
            discoverCreators,
            style: TextStyle(color: Colors.black),
          ),
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
        Text(name, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
