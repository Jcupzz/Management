import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CS extends StatefulWidget {
  @override
  _CSState createState() => _CSState();
}

class _CSState extends State<CS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.colorCard,
      body: Column(
        children: [
          Flexible(
            flex: 12,
            child: Lottie.asset("assets/lottie/cs_three.json",
                width: double.infinity,
                height: double.infinity),
          ),
          Flexible(
              flex: 2,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: COLORS.colorPrimaryDark,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                  child: Text(
                    "Computer Science\nEngineering",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: "Sans",color: COLORS.colorText),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
