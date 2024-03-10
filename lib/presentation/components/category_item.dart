import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Color categoryColor;
  final String categoryText;

  const CategoryItem({super.key, required this.categoryColor, required this.categoryText,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Ink(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: categoryColor.withAlpha(20)
        ),
        child: Center(
          child: Text(
            categoryText,
            style: TextStyle(
              color: categoryColor,
              fontSize: 12,
              fontFamily: 'Uni Neue',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
