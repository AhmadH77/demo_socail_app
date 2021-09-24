import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app_demo/constants/dimens.dart';
import 'package:social_app_demo/constants/strings.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/homepage';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: twoFiftyDp,
            decoration: BoxDecoration(color: Colors.green),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(tenDp),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: thirtyDp),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/images/a.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(thirtyDp),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search_outlined, size: fortyDp),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notifications_none_outlined,
                                  size: fortyDp),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.send, size: fortyDp),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: TabBar(controller: _tabController, tabs: [
                    Tab(
                      text: Main,
                    ),
                    Tab(
                      text: trending,
                    ),
                    Tab(
                      text: explore,
                    ),
                  ]),
                ),
              ],
            ),
          ),
          /*Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [MainPage(), TrendingPage(), ExplorePage()],
            ),
          )*/
        ],
      ),
    );
  }
}
