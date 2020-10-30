import 'package:cce/Pages/MyBottomNavigationBar.dart';
import 'package:cce/Pages/home.dart';
import 'package:cce/Theme/ThemeController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/Register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:cce/Theme/ThemeController.dart';

String userId;
bool success = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = prefs.getString('userId');
  print(email);
  userId = email;
  await Firebase.initializeApp();
  Get.lazyPut<ThemeController>(() => ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeController.to.getThemeModeFromPreferences();
    return GetMaterialApp(
      home: userId == null ? RegisterPage() : MyBottomNavigationBar(),
      theme: ThemeData.light().copyWith(
        accentColorBrightness: Brightness.light,
        primaryColor: Color(0xff00766c),
        primaryColorDark: Color(0xFF005b4f),
        cardColor: Color(0xFF64d8cb),
        backgroundColor: Color(0xFF26a69a),
        accentColor: Color(0xFF14ffec),
        brightness: Brightness.light,
        splashColor: Colors.green[300],
        buttonColor: Color(0xFF64d8cb),
      ),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.grey[850],
          primaryColorDark: Colors.black,
          cardColor: Colors.grey[800],
          backgroundColor: Colors.grey[900],
          accentColor: Colors.teal[100],
          brightness: Brightness.dark,
          splashColor: Colors.blueGrey[900],
          buttonColor: Colors.grey[700],
          accentColorBrightness: Brightness.dark),
      themeMode: ThemeController.to.themeMode,
    );

    //    home: userId == null ? RegisterPage() : MyBottomNavigationBar(),
  }
}

//TODO check and remove redirection to container from here if possible
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CCE',
//       theme: ThemeData(),
//       home: success ? HomeScreen() : RegisterPage(),
//     );
//   }
// }

