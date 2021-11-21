import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/models/comment.dart';
import 'package:social_app_demo/models/user.dart';
import 'package:social_app_demo/models/video.dart';
import 'package:social_app_demo/widgets/smallVideoItem.dart';

class ShortieTrending extends StatefulWidget {
  const ShortieTrending({Key? key}) : super(key: key);

  @override
  _ShortieTrendingState createState() => _ShortieTrendingState();
}

class _ShortieTrendingState extends State<ShortieTrending> {

  List<List<Video>> videos = [
   [
     Video(
        3,
        '10K',
        'Göra Frihetsgudinnan i Minecraft | LIVE',
        'test Video',
        false,
        'assets/images/pop1.png',
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
        'assets/images/pop2.png',
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
    Video(
        3,
        '10K',
        'Göra Frihetsgudinnan i Minecraft | LIVE',
        'test Video',
        false,
        'assets/images/popularTrending.png',
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
          Comment(
              'Jag målar inte drömmar eller mardrömmar,',
              user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
        ]),
   ],
    [
      Video(
          3,
          '10K',
          'Göra Frihetsgudinnan i Minecraft | LIVE',
          'test Video',
          false,
          'assets/images/stand1.png',
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
          'assets/images/stand2.png',
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
      Video(
          3,
          '10K',
          'Göra Frihetsgudinnan i Minecraft | LIVE',
          'test Video',
          false,
          'assets/images/stand3.png',
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
            Comment(
                'Jag målar inte drömmar eller mardrömmar,',
                user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
          ]),
    ],
    [
      Video(
          3,
          '10K',
          'Göra Frihetsgudinnan i Minecraft | LIVE',
          'test Video',
          false,
          'assets/images/Valorant1.png',
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
          'assets/images/Valorant2.png',
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
      Video(
          3,
          '10K',
          'Göra Frihetsgudinnan i Minecraft | LIVE',
          'test Video',
          false,
          'assets/images/Valorant3.png',
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
            Comment(
                'Jag målar inte drömmar eller mardrömmar,',
                user: UserModel(1, 'user1', 'assets/images/restaurant-5.jpg')),
          ]),
    ]
  ];
  List trendingCategory = ['Popular','Stand up comedy', 'Valorant'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 17,left: 11),
        itemBuilder: (context, listIndex) {
          return  Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text('${trendingCategory[listIndex]}',style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),),
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: videos[listIndex].length,
                    itemBuilder: (context, index) {
                      return SmallVideoItem( index, videos[listIndex],source: 'trending',);
                    },
                  ),
                ),
              ],
            ),
          );
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('test1'),
          //     Container(
          //       height: 250,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         scrollDirection: Axis.horizontal,
          //         itemCount: videos.length,
          //           itemBuilder: (context, index) {
          //             return SmallVideoItem(videos[index]);
          //           },
          //       ),
          //     ),
          //   ],
          // ),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Text('test1'),
          //     Container(
          //       height: 250,
          //       child: ListView.builder(
          //         shrinkWrap: true,
          //         scrollDirection: Axis.horizontal,
          //         itemCount: videos.length,
          //           itemBuilder: (context, index) {
          //             return SmallVideoItem(videos[index]);
          //           },
          //       ),
          //     ),
          //   ],
          // ),
        },
      ),
    );
  }
}
