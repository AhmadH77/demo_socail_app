import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:social_app_demo/util/const.dart';

class LivePageController with ChangeNotifier, DiagnosticableTreeMixin {
  int _index = 0;
  late RtcEngine engine;

  int get index => _index;

  void change(value) {
    _index = value;
    notifyListeners();
  }

  Future<void> initAgoraRtcEngine() async {
    debugPrint('initAgoraRtcEngine begin');

    engine =
    await RtcEngine.createWithContext(RtcEngineContext(Constants.APP_ID));
    await engine.enableVideo();

    await engine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    notifyListeners();

    debugPrint('initAgoraRtcEngine done');
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty('RtcEngine', engine));
  }
}