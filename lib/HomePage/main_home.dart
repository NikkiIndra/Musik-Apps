import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/HomePage/home_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'exploler_screen.dart';
import 'feed_screen.dart';
import 'library_screen.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  static int _selectedIndex = 0;

  // ignore: constant_identifier_names
  static const List<Widget> _PageScreen = <Widget>[
    HomeScreen(),
    ExplolerScreen(),
    FeedScreen(),
    LibraryScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _PageScreen[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                backgroundColor: Colors.white,
                curve: Curves.fastOutSlowIn,
                activeColor: Colors.teal,
                gap: 8,
                iconSize: 25,
                padding: const EdgeInsets.all(8),
                hoverColor: Colors.tealAccent,
                color: Colors.black,
                selectedIndex: _selectedIndex,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                tabs: [
                  GButton(
                    icon: CupertinoIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: CupertinoIcons.search,
                    text: 'Search',
                  ),
                  GButton(
                    icon:
                        CupertinoIcons.rectangle_fill_on_rectangle_angled_fill,
                    text: 'Feed',
                  ),
                  GButton(
                    icon: CupertinoIcons.list_bullet_below_rectangle,
                    text: 'Library',
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
