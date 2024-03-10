import 'package:flutter/material.dart';

import '../../utills/constants/utils.dart';

class TextFieldAuth extends StatelessWidget {
  final String hintText;

  const TextFieldAuth({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: redColor, width: 1.0),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).textTheme.bodySmall?.color,
            fontSize: 14,
            fontFamily: 'Uni Neue',
            fontWeight: FontWeight.w500,
            height: 0,
          )),
    );
  }
}
