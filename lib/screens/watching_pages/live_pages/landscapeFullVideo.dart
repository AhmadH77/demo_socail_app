import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app_demo/models/video.dart';

class LandscapeFullVideo extends StatefulWidget {
  const LandscapeFullVideo(Video video, {Key? key}) : super(key: key);

  @override
  _LandscapeFullVideoState createState() => _LandscapeFullVideoState();
}

class _LandscapeFullVideoState extends State<LandscapeFullVideo>  with TickerProviderStateMixin{

  late TabController tabController;
  List currencyList = ['\$ 5' , '\$ 10' , '\$ 50', '\$ 100', '\$ 150' , '\$ 200' , '\$ 250' , '\$ 300','\$ 350' ];
  int currencyTabIndex = 0, selected = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/cover.jpg',
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.forward_5,color: Colors.white,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.pause,color: Colors.white)),
                Directionality(
                  textDirection: TextDirection.ltr,
                    child: IconButton(onPressed: (){}, icon: Icon(Icons.replay_5,color: Colors.white,textDirection: TextDirection.rtl,))),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Column(
                children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.settings_outlined, color: Colors.white,)),
                  IconButton(onPressed: (){
                    // showRewardDialog();
                  }, icon: Icon(Icons.celebration_outlined, color: Colors.white,)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  void showRewardDialog() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft:  Radius.circular(20))),
        builder: (context) {
          return StatefulBuilder(

            builder: (context, setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0,right: 12,top: 20, bottom: 50),
                    child: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: false,
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.white)

                        ),
                        controller: tabController,

                        tabs: [
                          Tab(
                            child: InkWell(
                              onTap: (){
                                setState.call((){
                                  tabController.index = 0;
                                  currencyTabIndex = 0;
                                });

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: tabController.index == 1 ? Border.all(color: Colors.black):Border.all(color: Colors.white)
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.money),
                                        Text('Currency')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Tab(
                              child:
                              InkWell(
                                onTap: (){
                                  print('tttttt  $currencyTabIndex');
                                  tabController.index = 1;
                                  currencyTabIndex = 0;
                                  print('tttttt  $currencyTabIndex');
                                  setState;

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: tabController.index == 0 ? Border.all(color: Colors.black):Border.all(color: Colors.white)
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.fast_rewind),
                                          Text('Rewards')
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          )

                        ]
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: [
                          currencyTabIndex ==0
                              ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: GridView.builder(
                                  padding: EdgeInsets.all(10),
                                  itemCount: currencyList.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 2.5,
                                    crossAxisSpacing: 15,
                                    mainAxisSpacing: 30,
                                  ),

                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (){
                                        setState.call((){
                                          selected = index;
                                        });
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        color: selected == index ? Colors.grey : Colors.white,
                                        child: Center(
                                          child: Text(currencyList[index]),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty.all(Colors.white),
                                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                                    ),
                                    onPressed: (){
                                      setState.call((){
                                        currencyTabIndex = 1;
                                      });
                                    },
                                    child: Text('Enter Amount', style: TextStyle(color: Colors.yellow),)),
                              )
                            ],
                          )
                              : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(currencyList[selected], style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
                              ElevatedButton(
                                  style: ButtonStyle(
                                      padding: MaterialStateProperty.all(EdgeInsets.only(top: 20,bottom: 20,left: 50,right: 50)),
                                      side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                                      backgroundColor: MaterialStateProperty.all(Colors.white),
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                                  ),
                                  onPressed: (){},
                                  child: Text('Confirm', )),
                            ],
                          ),
                          Center(child: Text('test')),]),
                  )
                ],
              );
            },
          );
        });
  }


}
