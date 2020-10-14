import 'package:cached_network_image/cached_network_image.dart';
import 'package:cce/Pages/Register.dart';
import 'package:cce/Pages/UserProfile.dart';
import 'package:cce/Post_Feed_Pages/Add_Post.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cce/Post_Feed_Pages/Add_Post.dart';
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
  Future<List<DocumentSnapshot>> _future;
  Query C_Ref = FirebaseFirestore.instance
      .collection("Post")
      .orderBy('posted_time', descending: true);

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
                    MaterialPageRoute(builder: (context) => UserProfile()),
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
      body: Container(
          width: MediaQuery.of(context).size.width,
          child: StreamBuilder<QuerySnapshot>(
            stream: C_Ref.snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.grey[600],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                        child: Text("Username"),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: document.data()['url'],
                          placeholder: ((context, s) => Center(
                                child: CircularProgressIndicator(),
                              )),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        IconButton(
                          icon: Icon(Icons.favorite_border_rounded),
                          color: Colors.grey[400],
                          onPressed: () {},
                        ),
                        IconButton(
                          alignment: Alignment.centerRight,
                          icon: Icon(Icons.alarm_add_rounded),
                          color: Colors.grey[400],
                          onPressed: () {},
                        ),
                      ]),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(document.data()['caption']),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Text(
                          format_posted_time(document.data()['posted_time']),
                          style: TextStyle(fontSize: 12),
                        ),
                  
                      ),
                    ],
                  );
                }).toList(),
              );
            },
          )),
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

  String format_posted_time(Timestamp posted_time) {
    DateTime postedDate =
        posted_time.toDate(); //Converted timestamp to DateTime

    bool numericDates = true;

    final date2 = DateTime.now();

    final difference = date2.difference(postedDate);

    if (difference.inDays > 8) {
      return 'More than 8 days'; // TODO : Should change more than 8 days
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

}
