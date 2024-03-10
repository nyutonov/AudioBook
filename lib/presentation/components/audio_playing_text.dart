import 'package:flutter/cupertino.dart';

class AudioPlayingText extends StatelessWidget {
  final int second;

  const AudioPlayingText({super.key, required this.second});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${(second ~/ 60 < 10) ? 0 : ''}${second ~/ 60}:${(second % 60 < 10) ? 0 : ''}${second % 60}',
      style: TextStyle(
        // color: tintColor,
        fontSize: 14,
        fontFamily: 'Uni Neue',
        fontWeight: FontWeight.w500,
        height: 0,
      ),
    );
  }
}
