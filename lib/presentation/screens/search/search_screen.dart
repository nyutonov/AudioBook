import 'package:flutter/material.dart';

import '../../../utills/constants/utils.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21.0, vertical: 21),
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: tintColor,
                  fontSize: 12,
                  fontFamily: 'Uni Neue',
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFF3F3F3),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: redColor,
                      width: 1,
                    )
                  ),
                  hintText: 'search books',
                  hintStyle: TextStyle(
                    color: tintColor,
                    fontSize: 12,
                    fontFamily: 'Uni Neue',
                    fontWeight: FontWeight.w500,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  prefixIcon: const Icon(Icons.arrow_back),
                  prefixIconColor: tintColor,
                ),
              ),
              const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0,horizontal: 2),
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 20,
                        color: Color(0xFF4F4F4F),
                      ),
                      SizedBox(width: 16,),
                      Text(
                        'Bangla audio book 2021vbfvhfvhfbvfvf',
                        style: TextStyle(
                          color: Color(0xFF4F4F4F),
                          fontSize: 14,
                          fontFamily: 'Uni Neue',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      Spacer(),
                      Icon(
                        Icons.add,
                        size: 20,
                        color: Color(0xFF4F4F4F),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}



