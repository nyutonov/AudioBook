import 'package:flutter/material.dart';

import '../../../utills/constants/utils.dart';
import '../home/home_screen.dart';
import '../library/library_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int pageIndex = 0;
  final pages = [
    const HomeScreen(),
    const SearchScreen(),
    const LibraryScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[pageIndex],
      floatingActionButton: Container(
        height: 66,
        width: 66,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 0.5
          )
        ),
        child: FloatingActionButton(
          onPressed: () {  },
          heroTag: 'button',
          highlightElevation: 0,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(60)
          ),
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          child: Icon(
            Icons.play_circle_fill_outlined,
            color: redColor,
            size: 64
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        surfaceTintColor: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.onBackground,
        elevation: 10,
        padding: const EdgeInsets.all(0),
        notchMargin: 8,
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onBackground,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => setState(() { pageIndex = 0; }),
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width / 4 - 15,
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset(
                      'assets/icons/home.png',
                      color: (pageIndex == 0) ? redColor : tintColor,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() { pageIndex = 1; }),
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width / 4 - 15,
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset(
                      'assets/icons/search.png',
                      color: (pageIndex == 1) ? redColor : tintColor,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() { pageIndex = 2; }),
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width / 4 - 15,
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Image.asset(
                      'assets/icons/library.png',
                      color: (pageIndex == 2) ? redColor : tintColor,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => setState(() { pageIndex = 3; }),
                child: Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width / 4 - 15,
                  child: GestureDetector(
                    onTap: () => setState(() { pageIndex = 3; }),
                    child: SizedBox(
                      height: 45,
                      width: 45,
                      child: Image.asset(
                        'assets/icons/profile.png',
                        color: (pageIndex == 3) ? redColor : tintColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}