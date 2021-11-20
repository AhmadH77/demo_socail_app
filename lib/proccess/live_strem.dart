import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:social_app_demo/util/const.dart';

class LiveStreamProcess{
  int _remoteUid = 0;

  bool _joined = false;


  // Init the app
  Future<Map<int , bool>> initPlatformState() async {
    Map<int , bool> result = Map();
    print('test');
    await [Permission.camera, Permission.microphone].request();

    // Create RTC client instance
    RtcEngineContext context = RtcEngineContext(Constants.APP_ID);
    var engine = await RtcEngine.createWithContext(context);
    // Define event handling logic
    // engine.setEventHandler(RtcEngineEventHandler(
    //     joinChannelSuccess: (String channel, int uid, int elapsed) {
    //       print('joinChannelSuccess ${channel} ${uid}');
    //
    //       _joined = true;
    //
    //     }, userJoined: (int uid, int elapsed) {
    //   print('userJoined ${uid}');
    //   _remoteUid = uid;
    //
    // }, userOffline: (int uid, UserOfflineReason reason) {
    //   print('userOffline ${uid}');
    //
    //     _remoteUid = 0;
    //
    // },
    // error: (err) {
    //   print('RtcEngineEventHandler error $err ${err.index}');
    //   engine.destroy();
    //   },
    //   warning: (warn) {
    //     print('RtcEngineEventHandler warning $warn ${warn.index}');
    //     engine.destroy();
    //   },
    //   connectionStateChanged: (state, reason) {
    //     print('connectionStateChanged $state - $reason ');
    //   },
    // ));
    result.putIfAbsent(_remoteUid, () => _joined);
    print('test');
    // Enable video
    await engine.enableVideo();
    // Set channel profile as livestreaming
    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    // Set user role as broadcaster
    await engine.setClientRole(ClientRole.Broadcaster);
    // Join channel with channel name as 123
    await engine.joinChannel(Constants.Token, 'test', null, 0);

    print('_remoteUid $_remoteUid   -  _joined $_joined');
    return result;
  }
}