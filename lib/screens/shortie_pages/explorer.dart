import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/util/const.dart';

class ShortieExplorer extends StatefulWidget {
  const ShortieExplorer({Key? key}) : super(key: key);

  @override
  _ShortieExplorerState createState() => _ShortieExplorerState();
}

class _ShortieExplorerState extends State<ShortieExplorer> {
  List<Video> videos = [
    Video(
        3,
        '10K',
        'Göra Frihetsgudinnan i Minecraft | LIVE',
        'test Video',
        false,
        'assets/images/explorer1.png',
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
        false,
        'assets/images/explorer2.png',
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
          Comment('Jag målar inte drömmar eller mardrömmar,',
              user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
        ]),
    Video(
        3,
        '10K',
        'Göra Frihetsgudinnan i Minecraft | LIVE',
        'test Video',
        false,
        'assets/images/explorer3.png',
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
        false,
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
          Comment('Jag målar inte drömmar eller mardrömmar,',
              user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
        ]),
  ];

  List explorerCategory = ['Hot Topics', 'Hashtags'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 0),
        children: [
          Padding(
            padding: EdgeInsets.only(left: 18, right: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    '${explorerCategory[0]}',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5, bottom: 5),
                      height: 117,
                      width: MediaQuery.of(context).size.width * 44 / 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            videos[0].image,
                            fit: BoxFit.cover,
                          ).image),
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sports',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, bottom: 5),
                      height: 117,
                      width: MediaQuery.of(context).size.width * 44 / 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            videos[1].image,
                            fit: BoxFit.cover,
                          ).image),
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Talban',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5, bottom: 5),
                      height: 117,
                      width: MediaQuery.of(context).size.width * 44 / 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: Image.asset(
                            videos[2].image,
                            fit: BoxFit.cover,
                          ).image),
                          borderRadius: BorderRadius.circular(10)),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Horror',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5, bottom: 5),
                      height: 117,
                      width: MediaQuery.of(context).size.width * 44 / 100,
                      decoration: BoxDecoration(
                          color: Constants.orangeDark,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          '+ More',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 13, right: 13,top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    '${explorerCategory[1]}',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                ),
                GridView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: 10,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                      childAspectRatio: 2.5),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Card(
                        color: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
