import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.image = "assets/images/background.png",

  }) : super(key: key);

  final String image;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Stack(
          children: [
            Positioned(
              child:
              Image.asset(
                  image
              )
            ),
            SafeArea(
                child: child
            )
          ],
        ),
      ),
    );
  }
}
