import 'package:cce/Pages/Branch.dart';
import 'package:cce/Pages/UserProfile.dart';
import 'package:cce/Pages/home.dart';
import 'package:cce/Pages/profile.dart';
import 'package:cce/Theme/COLORS.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _page = 0;
  final _pageOption = [Branch(), HomeScreen(), UserProfile()];

  @override
  Widget build(BuildContext context) {
    HapticFeedback.heavyImpact();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 200),
        backgroundColor: Theme.of(context).backgroundColor,
        color: Theme.of(context).primaryColorDark,
        buttonBackgroundColor: Theme.of(context).primaryColorDark,
        height: 60,
        items: <Widget>[
          Icon(
            Icons.note_add,
            size: 20,
            color: Theme.of(context).accentColor,
          ),
          Icon(
            Icons.home,
            size: 20,
            color: Theme.of(context).accentColor,
          ),
          Icon(
            Icons.person,
            size: 20,
            color: Theme.of(context).accentColor,
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
