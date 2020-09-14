import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CE extends StatefulWidget {
  @override
  _CEState createState() => _CEState();
}

class _CEState extends State<CE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.colorCard,
      body: Column(
        children: [
          Flexible(
            flex: 15,
            child: Lottie.asset("assets/lottie/civil_one.json",
                width: double.infinity,
                height: double.infinity),
          ),
          Divider(),
          Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: COLORS.colorPrimaryDark,
                child: Center(
                  child: Text(
                    "Civil Engineering",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Sans",color: COLORS.colorText),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ),
        ],
      ),
    );  }
}
