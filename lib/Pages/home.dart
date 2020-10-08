
import 'package:cce/Pages/Register.dart';
import 'package:cce/Pages/profile.dart';
import 'package:cce/Post_Feed_Pages/Add_Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:theme_provider/theme_provider.dart';

import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String theme_switcher_text = 'Dark Mode';

  Future<Null> getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString('userId');
    print("from getStri" + stringValue);
    String us = prefs.getString('userId');
    // return stringValue;
    setState(() {
      userId = us;
    });
  }

  @override
  Future<void> initState() {
    // TODO: implement initState
    userId = "Fetching..";
    getStringValuesSF();

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Theme.of(context).primaryColorDark),
                onDetailsPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                accountName: Text("Annon "),
                accountEmail: Text(userId),
                currentAccountPicture: CircleAvatar(
                  // backgroundColor:
                  //     Theme.of(context).platform == TargetPlatform.iOS
                  //         ? Colors.blue
                  //         : Colors.white,

                  backgroundImage: NetworkImage(
                    "https://images5.alphacoders.com/423/thumb-1920-423529.jpg",
                  ),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(userId),
                onTap: () {
                  // Update the state of the app.
                  // ...
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text("Logged in"),
        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: null),
          PopupMenuButton(
            onSelected: (result) {
              switch (result) {
                case 0:
                  addPost();
                  print("Add Post Clicked");
                  break;
                case 1:
                  themeSwitcher();
                  print("Darkmode switcher Clicked");
                  break;
                case 2:
                  print("Settings Clicked");
                  break;
                case 3:
                  logout();
                  print("Logout Clicked");
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 0, child: Text("Add Post")),
                PopupMenuItem(value: 1, child: Text(theme_switcher_text)),
                PopupMenuItem(value: 2, child: Text("Settings")),
                PopupMenuItem(value: 3, child: Text("Logout")),
              ];
            },
          )
        ],
      ),
      body: Container(),
    );
  }

  void themeSwitcher() {
    if (ThemeProvider.themeOf(context).data.brightness == Brightness.light) {
      ThemeProvider.controllerOf(context).setTheme("dark_theme");
      theme_switcher_text = 'Light Mode';
    } else {
      ThemeProvider.controllerOf(context).setTheme("light_theme");
      theme_switcher_text = 'Dark Mode';
    }
  }

  void addPost() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext buildContext) => Add_Post()));
  }

  void logout() async {
    success = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => RegisterPage()));
  }
}
