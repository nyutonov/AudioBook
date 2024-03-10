import 'package:flutter/material.dart';

import '../../utills/constants/utils.dart';

class ButtonAuth extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isShowNext;

  final Callback<bool> callback;

  const ButtonAuth({
    super.key,
    required this.text,
    required this.fontSize,
    required this.isShowNext,
    required this.callback
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(200))
          ),
          textStyle: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: 'Uni Neue',
            fontWeight: FontWeight.w700,
            height: 0,
          )
      ),
      onPressed: () { callback(true); },
      child: SizedBox(
          height: 52,
          width: 200,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize,
                      fontFamily: 'Uni Neue',
                      fontWeight: FontWeight.w700,
                      height: 0,
                    )
                  ),
                  (isShowNext) ? const Row(
                    children: [
                      SizedBox(
                          width: 10
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 28,
                      )
                    ],
                  ) : const SizedBox()
              ],
            )
          )
      ),
    );
  }
}
