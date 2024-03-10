import 'package:flutter/material.dart';

class GoBack extends StatelessWidget {
  const GoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).textTheme.bodySmall?.color
          ),
        ),
        Text(
          'Go Back',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontSize: 20,
            fontFamily: 'Uni Neue',
            fontWeight: FontWeight.w700,
          ),
        )
      ],
    );
  }
}
