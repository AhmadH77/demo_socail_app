import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:social_app_demo/util/const.dart';
import 'package:social_app_demo/widgets/card_button.dart';

class ChooseType extends StatelessWidget{

  List<StaggeredTile> _homeStaggeredTiles = <StaggeredTile>[
    StaggeredTile.count(3, 1.5),
    StaggeredTile.count(2, 1.5),
    StaggeredTile.count(2, 1.5),
    StaggeredTile.count(2, 1.5),
    StaggeredTile.count(3, 1.5),
    StaggeredTile.count(2, 1.5),
  ];

  List<Widget> _homeTiles = <Widget>[
    CardButton(color: Constants.createButtonColor,  icon: 'assets/svg/PencilLine.svg'),
    CardButton(color: Constants.createButtonColor2, icon: 'assets/svg/Image.svg'),
    CardButton(color: Constants.createButtonColor3, icon: 'assets/svg/VideoCamera.svg'),
    CardButton(color: Constants.createButtonColor4, icon: 'assets/svg/Microphone.svg'),
    CardButton(color: Constants.createButtonColor5, icon: 'assets/svg/threeColm.svg'),
    CardButton(color: Constants.createButtonColor6, icon: 'assets/svg/Fire.svg'),
  ];
  //
  List<StaggeredTile> _liveStaggeredTiles = <StaggeredTile>[
    StaggeredTile.count(3, 1.5),
    StaggeredTile.count(2, 1.5),
    StaggeredTile.count(2, 1.5),
  ];

  List<Widget> _liveTiles = <Widget>[
    CardButton(color: Constants.createButtonColor3, icon: 'assets/svg/VideoCamera.svg'),
    CardButton(color: Constants.createButtonColor7, icon: 'assets/svg/Microphone.svg'),
    CardButton(color: Constants.createButtonColor,  icon: 'assets/svg/TelevisionSimple.svg'),
  ];
  //
  List<StaggeredTile> _flicksStaggeredTiles = <StaggeredTile>[
    StaggeredTile.count(5, 1.5),
    StaggeredTile.count(2, 1.5),
  ];

  List<Widget> _flicksTiles = <Widget>[
    CardButton(color: Constants.createButtonColor2, icon: 'assets/svg/Lightning.svg'),
    CardButton(color: Constants.createButtonColor5, icon: 'assets/svg/Microphone.svg'),
  ];


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Create',
            style: TextStyle(color: Colors.blue, fontSize: 40,fontWeight: FontWeight.bold,fontFamily: 'regular'),
          ),
          Text(
            'Got to share something?\nLet the world know about it.',
            style: TextStyle( fontSize: 20,fontFamily: 'regular'),

          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Home',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 150,
            child: StaggeredGridView.count(
              crossAxisCount: 7,
              staggeredTiles: _homeStaggeredTiles,
              mainAxisSpacing: 1,
              crossAxisSpacing: 2,
              padding: const EdgeInsets.all(0),
              children: _homeTiles,
            ),
          ),
          //live
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Live',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100,
            child: StaggeredGridView.count(
              crossAxisCount: 7,
              staggeredTiles: _liveStaggeredTiles,
              mainAxisSpacing: 1,
              crossAxisSpacing: 2,
              padding: const EdgeInsets.all(0),
              children: _liveTiles,
            ),
          ),
          //flicks
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              'Flicks',
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 100,
            child: StaggeredGridView.count(
              crossAxisCount: 7,
              staggeredTiles: _flicksStaggeredTiles,
              mainAxisSpacing: 1,
              crossAxisSpacing: 2,
              padding: const EdgeInsets.all(0),
              children: _flicksTiles,
            ),
          ),
        ],
      ),
    );
  }

}