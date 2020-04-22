import 'dart:async';
import 'dart:html';

import 'package:flutter/services.dart';

/// Web Player
abstract class WebPlayer {
  final MethodChannel channel;

  static final methodPosition = "player.position";
  static final methodVolume = "player.volume";
  static final methodFinished = "player.finished";
  static final methodIsPlaying = "player.isPlaying";
  static final methodCurrent = "player.current";

  WebPlayer({this.channel});

  get volume;

  set volume(double volume);

  get isPlaying;

  set isPlaying(bool value);

  double get currentPosition;

  void play();

  void pause();

  void stop();

  String findAssetPath(String path) {
    //in web, assets are packaged in a /assets/ folder
    //if you want "/asset/3" as described in pubspec
    //it will be in /assets/asset/3

    /* for release mode, need to change the "url", remove the /#/ and add /asset before */
    if (path.startsWith("/")) {
      path = path.replaceFirst("/", "");
    }
    path = (window.location.href.replaceAll("/#/", "") + "/assets/" + path);
    return path;
  }

  Future<void> open({String path, double volume, bool autoStart});

  void seek({double to});
}