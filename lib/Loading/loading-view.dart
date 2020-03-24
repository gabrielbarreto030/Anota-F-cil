import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/services.dart';

import 'loading-controller.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startSplashScreenTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Container(
      decoration: new BoxDecoration(color: Colors.blue),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("images/bloco-logo.png"),
          ],
        ),
      ),
    );
  }
}
