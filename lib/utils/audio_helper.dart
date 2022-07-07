import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class AudioHelper {
  /// Plays a [soundNumber] corresponding to an audio asset
  static playSound(int soundNumber) {
    final player = AudioPlayer();
    return player.play(AssetSource('note$soundNumber.wav'));
  }

  /// Counts the note files in the assets folder to determine how many keys
  /// to build in the keyboard
  static Future<int> getSoundCount() async {
    final assetManifest = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> assetMap = json.decode(assetManifest);
    return assetMap.entries.where((e) => e.key.endsWith('.wav')).length;
  }
}
