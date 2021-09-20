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
              margin: EdgeInsets.only(top: sixteenDp, right: 6),
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(28),
              ),
            ),
            Positioned(
              top: 72,
              left: 64,
              child: Container(
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(twentyDp)),
              ),
            ),
          ],
        ),
        Text(yourStory, style: TextStyle(color: Colors.black, fontSize: 12)),
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
                top: 20,
                right: sixteenDp,
              ),
              height: 80,
              width: eightyDp,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(thirtyDp),
              ),
            ),
            Positioned(
              top: 12,
              child: Container(
                height: thirtyDp,
                width: thirtyDp,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(twentyDp)),
              ),
            ),
            Positioned(
              top: 68,
              left: 55,
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
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ),
      ],
    );
  }

  Widget buildStories(Color color, name) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 14, right: 8),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(26),
          ),
        ),
        Text(name, style: TextStyle(color: Colors.black)),
      ],
    );
  }
}
