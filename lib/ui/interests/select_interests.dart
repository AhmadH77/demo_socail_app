import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/util/app_actions.dart';
import 'package:social_app_demo/widget/interest_container.dart';
import 'package:social_app_demo/widget/search_box.dart';

class SelectInterests extends StatefulWidget {
  const SelectInterests({Key? key}) : super(key: key);

  @override
  _SelectInterestsState createState() => _SelectInterestsState();
}

class _SelectInterestsState extends State<SelectInterests> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: fortyDp, left: sixteenDp),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  onPressed: () {
                    AppActions.popActivity(context);
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: tenDp, top: fortyDp, left: 0),
                height: fortyDp,
                width: hundredDp,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(twentyDp)),
                  minWidth: MediaQuery.of(context).size.width,
                  height: fiftyDp,
                  onPressed: () {},
                  child: Text(
                    skip,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: twentyDp,
                        fontFamily: 'semipop',
                        fontWeight: FontWeight.w400),
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
          SearchBox(controller: _searchController, borderColor: Colors.black),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //row 1
                  rowItem(
                      InterestContainer(
                        image: gamingImage,
                        width: oneTwentyDp,
                        height: oneTwentyDp,
                        title: gaming,
                        onTap: () {},
                        marginTop: 0,
                        marginRight: tenDp,
                        marginBottom: 0,
                        marginLeft: sixteenDp,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InterestContainer(
                                  image: popImage,
                                  width: eightyDp,
                                  height: sixtyDp,
                                  title: pop,
                                  marginTop: tenDp,
                                  marginRight: 4,
                                  marginBottom: fourDp,
                                  marginLeft: 0,
                                  onTap: () {}),
                              InterestContainer(
                                  marginTop: tenDp,
                                  marginRight: 0,
                                  marginBottom: 0,
                                  marginLeft: 0,
                                  image: pop1,
                                  width:
                                      MediaQuery.of(context).size.width - 235,
                                  height: sixtyDp,
                                  title: '',
                                  onTap: () {})
                            ],
                          ),
                          InterestContainer(
                              marginTop: 0,
                              marginRight: 0,
                              marginBottom: 10,
                              marginLeft: 0,
                              image: pop2,
                              width: MediaQuery.of(context).size.width - 150,
                              height: sixtyDp,
                              title: '',
                              onTap: () {})
                        ],
                      )),

                  //row 2
                  InterestContainer(
                      image: educationImage,
                      width: MediaQuery.of(context).size.width,
                      height: oneTwentyDp,
                      title: '',
                      onTap: () {},
                      marginTop: 0,
                      marginLeft: sixteenDp,
                      marginRight: eightDp,
                      marginBottom: 0),

                  //row 3
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InterestContainer(
                          image: sportsImage,
                          width: oneTwentyDp,
                          height: oneTwentyDp,
                          title: '',
                          marginTop: tenDp,
                          marginRight: fourDp,
                          marginBottom: fourDp,
                          marginLeft: sixteenDp,
                          onTap: () {}),
                      InterestContainer(
                          marginTop: tenDp,
                          marginRight: 0,
                          marginBottom: 0,
                          marginLeft: 0,
                          image: lifeStyleImage,
                          width: MediaQuery.of(context).size.width - 150,
                          height: oneTwentyDp,
                          title: '',
                          onTap: () {})
                    ],
                  ),

                  //row 4
                  InterestContainer(
                      image: musicImage,
                      width: MediaQuery.of(context).size.width,
                      height: oneTwentyDp,
                      title: '',
                      onTap: () {},
                      marginTop: 0,
                      marginLeft: sixteenDp,
                      marginRight: eightDp,
                      marginBottom: 0),

                  //row 5
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InterestContainer(
                          image: m1,
                          width: oneTwentyDp,
                          height: oneTwentyDp,
                          title: '',
                          marginTop: tenDp,
                          marginRight: fourDp,
                          marginBottom: fourDp,
                          marginLeft: sixteenDp,
                          onTap: () {}),
                      InterestContainer(
                          marginTop: tenDp,
                          marginRight: 0,
                          marginBottom: 0,
                          marginLeft: 0,
                          image: m2,
                          width: MediaQuery.of(context).size.width - 150,
                          height: oneTwentyDp,
                          title: '',
                          onTap: () {})
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget rowItem(Widget widgetA, Widget widgetB) {
    return Row(
      children: [widgetA, widgetB],
    );
  }
}
