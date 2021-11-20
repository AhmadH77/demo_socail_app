import 'package:agora_uikit/agora_uikit.dart';
import 'package:agora_uikit/models/agora_user.dart';
import 'package:flutter/material.dart';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/src/provider.dart';
import 'package:social_app_demo/provider/live_page_controller.dart';
import 'package:social_app_demo/util/const.dart';
import 'package:social_app_demo/widgets/dialogs/new_content.dart';

import 'mainScreen.dart';

class LiveStream extends StatefulWidget {
  // final String channelName;
  final bool isBroadcaster;

  const LiveStream({Key? key, required this.isBroadcaster}) : super(key: key);

  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {
  final _users = <int>[];
  late RtcEngine _engine;
  bool muted = false;
  late int streamId;

  @override
  void dispose() {
    debugPrint('dispose ');
    // clear users
    _users.clear();
    // destroy sdk and leave channel
    _engine.destroy();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // initialize agora sdk
    // if(!widget.isBroadcaster) initializeAgora();
    Future.delayed(Duration.zero , ()async{
      NewContentDialog().show(context);
      await context.read<LivePageController>().initAgoraRtcEngine();
      _engine = context.read<LivePageController>().engine;

      if (widget.isBroadcaster) {
        await _engine.setClientRole(ClientRole.Broadcaster);
      } else {
        print('test 123 ');
        await _engine.setClientRole(ClientRole.Audience);
      }
      if (widget.isBroadcaster)
        streamId = (await _engine.createDataStream(false, false))!;
      setState(() {

      });
    });
  }

  Future<void> initializeAgora() async {

    await _engine.joinChannel(Constants.Token, 'test', null, 0);

    _engine.setEventHandler(RtcEngineEventHandler(
      joinChannelSuccess: (channel, uid, elapsed) {
        setState(() {
          print('onJoinChannel: $channel, uid: $uid');
        });
      },
      leaveChannel: (stats) {
        setState(() {
          print('onLeaveChannel');
          _users.clear();
        });
      },
      userJoined: (uid, elapsed) {
        setState(() {
          print('userJoined: $uid');

          _users.add(uid);
        });
      },
      userOffline: (uid, elapsed) {
        setState(() {
          print('userOffline: $uid');
          _users.remove(uid);
        });
      },
      streamMessage: (_, __, message) {
        final String info = "here is the message $message";
        print(info);
      },
      streamMessageError: (_, __, error, ___, ____) {
        final String info = "here is the error $error";
        print(info);
      },
      warning: (warn) {
        print('warning  $warn ${warn.index}');
      },
      error: (err) {
        print('error $err ${err.index}');
      },
    ));
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    final AgoraClient client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
          appId: Constants.APP_ID,
          tempToken: Constants.Token,
          channelName: "test",
          uid: 1),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
    );


    return Scaffold(

      body: Stack(
        children: widget.isBroadcaster
            ? [
                AgoraVideoViewer(
                  client: client,
                  showAVState: true,
                  showNumberOfUsers: false,
                ),
                _toolbar()
                // AgoraVideoButtons(
                //   client: client,
                // ),
              ]
            : [
                _broadcastView(),

                // _toolbar(),
              ],
      ),
    );
  }

  Padding numberOfUsers() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          color: Colors.black54,
          padding: const EdgeInsets.all(3),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.remove_red_eye_outlined,
                color: Colors.white,
              ),
              Text(
                ' ${_users.length + 1}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _toolbar() {
    return widget.isBroadcaster
        ? Stack(
          children: [
            numberOfUsers(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: ()=>  _engine.destroy(),//Navigator.pop(context),//pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainScreen(index: 0,),), (route) => false),
                    icon: Icon(Icons.close, color: Colors.white,)
                    // SvgPicture.asset('assets/svg/back.svg', color: Colors.white,)
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RawMaterialButton(
                        onPressed: () => initializeAgora(),
                        child: SvgPicture.asset('assets/svg/startButton.svg') ,
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor:  Colors.transparent,
                      ),
                      // RawMaterialButton(
                      //   onPressed: _onToggleMute,
                      //   child: Icon(
                      //     muted ? Icons.mic_off : Icons.mic,
                      //     color: muted ? Colors.white : Colors.blueAccent,
                      //     size: 20.0,
                      //   ),
                      //   shape: CircleBorder(),
                      //   elevation: 2.0,
                      //   fillColor: muted ? Colors.blueAccent : Colors.white,
                      //   padding: const EdgeInsets.all(12.0),
                      // ),
                      // RawMaterialButton(
                      //   onPressed: () => _onCallEnd(context),
                      //   child: Icon(
                      //     Icons.call_end,
                      //     color: Colors.white,
                      //     size: 35.0,
                      //   ),
                      //   shape: CircleBorder(),
                      //   elevation: 2.0,
                      //   fillColor: Colors.redAccent,
                      //   padding: const EdgeInsets.all(15.0),
                      // ),
                      IconButton(
                        onPressed: _onSwitchCamera,
                        icon: Icon(
                          Icons.switch_camera,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        )
        : Container();
  }

  /// Helper function to get list of native views
  List<Widget> _getRenderViews() {
    final List<StatefulWidget> list = [];
    if (widget.isBroadcaster) {
      list.add(RtcLocalView.SurfaceView());
    }
    _users.forEach((int uid) => list.add(RtcRemoteView.SurfaceView(uid: uid)));
    return list;
  }

  /// Video view row wrapper
  Widget _expandedVideoView(List<Widget> views) {
    final wrappedViews = views
        .map<Widget>((view) => Expanded(child: Container(child: view)))
        .toList();
    return Expanded(
      child: Row(
        children: wrappedViews,
      ),
    );
  }

  /// Video layout wrapper
  Widget _broadcastView() {
    final views = _getRenderViews();

    switch (views.length) {
      case 1:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView([views[0]])
          ],
        ));
      case 2:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView([views[0]]),
            _expandedVideoView([views[1]])
          ],
        ));
      case 3:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 3))
          ],
        ));
      case 4:
        return Container(
            child: Column(
          children: <Widget>[
            _expandedVideoView(views.sublist(0, 2)),
            _expandedVideoView(views.sublist(2, 4))
          ],
        ));
      default:
    }
    return Container();
  }

  void _onCallEnd(BuildContext context) {
    Navigator.pop(context);
  }

  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    _engine.muteLocalAudioStream(muted);
  }

  void _onSwitchCamera() {
    // if (streamId != null) _engine.sendStreamMessage(streamId, "mute user blet");
    _engine.switchCamera();
  }

}
