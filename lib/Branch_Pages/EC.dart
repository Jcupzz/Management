import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EC extends StatefulWidget {
  @override
  _ECState createState() => _ECState();
}

class _ECState extends State<EC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.colorCard,
      body: Column(
        children: [
          Flexible(
            flex: 15,
            child: Lottie.asset("assets/lottie/ec_lottie.json",
                width: double.infinity, height: double.infinity),
          ),
          Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: COLORS.colorPrimaryDark,
                child: Center(
                  child: Text(
                    "Electronics Engineering",
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
