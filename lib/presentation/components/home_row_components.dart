import 'package:flutter/material.dart';

import '../../utills/constants/utils.dart';

class HomeRowComponents extends StatelessWidget {
  final String componentName;

  const HomeRowComponents({super.key, required this.componentName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 30.0, bottom: 22, top: 27),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            componentName,
            style: TextStyle(
              fontFamily: 'Uni Neue',
              fontWeight: FontWeight.w700,
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 20
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Ink(
                child: Text(
                  'See All',
                  style: TextStyle(
                      fontFamily: 'Uni Neue',
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: redColor
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
