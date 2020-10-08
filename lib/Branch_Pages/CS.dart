import 'package:cce/Theme/COLORS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: Column(
        children: [
          Flexible(
            flex: 15,
            child: Lottie.asset(
              "assets/lottie/cs_seven.json",
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Flexible(
              flex: 3,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Theme.of(context).primaryColorDark,
                child: Center(
                  child: Text(
                    "Computer Science\nEngineering",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sans",
                        color: COLORS.colorText),
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
