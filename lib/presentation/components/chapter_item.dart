import 'package:flutter/material.dart';

import '../../utills/constants/utils.dart';

class ChapterItem extends StatelessWidget {
  final String name;
  final bool isPlay;
  final int minute;
  final Function onClick;

  const ChapterItem({
    super.key,
    required this.name,
    required this.isPlay,
    required this.minute,
    required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () => onClick(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          leading: Icon(
            (isPlay)
                ? Icons.pause_circle_outline
                : Icons.play_circle_outline,
            color: redColor,
            size: 25,
          ),
          title: Text(
            name,
            style: TextStyle(
              color: (isPlay)
                  ? Theme.of(context).textTheme.bodyMedium?.color
                  : Theme.of(context).textTheme.bodySmall?.color,
              fontSize: 16,
              fontFamily: 'Uni Neue',
              fontWeight: (isPlay)
                  ? FontWeight.w700
                  : FontWeight.w500,
            ),
          ),
          subtitle: Text(
            '$minute minutes',
            style: TextStyle(
              color: Theme.of(context).textTheme.bodySmall?.color,
              fontSize: 14,
              fontFamily: 'Uni Neue',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 0.5,
            color: Colors.black12,
          ),
        )
      ],
    );
  }
}
