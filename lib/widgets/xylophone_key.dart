import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xylophone/utils/audio_helper.dart';

class XylophoneKey extends StatelessWidget {
  final int soundNum;
  final List<Color> colors;

  const XylophoneKey({
    required this.soundNum,
    this.colors = const [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Color.fromARGB(255, 16, 107, 77),
      Colors.blue,
      Colors.purple
    ],
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> randomizeColor = ValueNotifier(false);
    return FutureBuilder(
      future: AudioHelper.getSoundCount(),
      builder: (_, AsyncSnapshot<int> snapshot) {
        return !snapshot.hasData
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ValueListenableBuilder(
                valueListenable: randomizeColor,
                builder: (_, __, value) {
                  return GestureDetector(
                    child: Container(
                        height: MediaQuery.of(context).size.height /
                            (snapshot.data! + 1),
                        color: randomizeColor.value
                            ? Colors.primaries[
                                Random().nextInt(Colors.primaries.length)]
                            : colors[soundNum - 1]),
                    onTap: () => AudioHelper.playSound(soundNum),
                    onLongPress: () =>
                        randomizeColor.value = !randomizeColor.value,
                  );
                },
              );
      },
    );
  }
}
