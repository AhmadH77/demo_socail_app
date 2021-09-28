import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';
import 'package:social_app_demo/widget/auth_button.dart';

class OnboardingPage extends StatefulWidget {
  static const routeName = '/onboardingPage';

  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            children: [
              //image 1
              backgroundImages('assets/images/1.jpg'),
              //image 2
              backgroundImages('assets/images/2.jpg'),
              //image 3
              backgroundImages('assets/images/3.jpg'),
              //image 4
              backgroundImages('assets/images/4.jpg'),
              //image 5
              backgroundImages('assets/images/4.jpg'),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: hundredDp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicatorCount(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: twoHundredDp),
              child: AuthButton(
                buttonName: signup,
                onButtonTapped: () {
                  //todo
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(top: threeTwentyDp),
              child: AuthButton(
                buttonName: login,
                onButtonTapped: () {
                  //todo
                },
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: twoHundredDp),
                child: Text(
                  welcomeToVasukam,
                  style:
                      TextStyle(color: Colors.white, fontSize: twentyEightDp),
                ),
              )),
        ],
      ),
    );
  }

  //animated container to show indicator
  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: eightDp,
      width: eightDp,
      margin: EdgeInsets.only(right: sixDp),
      decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(fourDp)),
    );
  }

  //list of indicators to show when user swipes
  List<Widget> indicatorCount() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      if (currentIndex == i) {
        indicators.add(indicator(true));
      } else {
        indicators.add(indicator(false));
      }
    }

    return indicators;
  }

  //displays bg images
  Widget backgroundImages(String image) {
    return Image.asset(
      image,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fitHeight,
      filterQuality: FilterQuality.high,
      colorBlendMode: BlendMode.darken,
      cacheHeight: 1550,
      //todo ?
      cacheWidth: 1024,
    );
  }
}
