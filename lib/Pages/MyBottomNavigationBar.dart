import 'package:cce/Pages/Branch.dart';
import 'package:cce/Pages/home.dart';
import 'package:cce/Pages/profile.dart';
import 'package:cce/Theme/COLORS.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _page = 0;
  final _pageOption = [Branch(), HomeScreen(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
        backgroundColor: COLORS.colorBackground,
        color: COLORS.colorPrimaryDark,
        buttonBackgroundColor: COLORS.colorPrimaryDark,
        height: 60,

        items: <Widget>[
          Icon(
            Icons.note_add,
            size: 20,
            color:COLORS.colorAccent,
          ),
          Icon(
            Icons.home,
            size: 20,
            color: COLORS.colorAccent,
          ),
          Icon(
            Icons.notifications_active,
            size: 20,
            color: COLORS.colorAccent,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOption[_page],
    );
  }
}
