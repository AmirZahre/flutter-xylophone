import 'package:flutter/material.dart';

import 'package:xylophone/utils/audio_helper.dart';
import 'package:xylophone/widgets/xylophone_key.dart';

/// Builds a Keyboard made up of [XylophoneKey]s from the sounds in assets
class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AudioHelper.getSoundCount(),
      builder: (_, AsyncSnapshot<int> snapshot) {
        return !snapshot.hasData
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data,
                itemBuilder: (_, index) => XylophoneKey(
                  soundNum: index + 1,
                ),
              );
      },
    );
  }
}
