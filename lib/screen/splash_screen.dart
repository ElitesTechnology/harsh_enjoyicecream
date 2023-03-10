import 'dart:async';
import 'package:flutter/material.dart';
import '../auth/google/login_signup.dart';
import '../constants/mediaquery.dart';

class Spalsh_Screen extends StatefulWidget {
  @override
  _Spalsh_ScreenState createState() => _Spalsh_ScreenState();
}

class _Spalsh_ScreenState extends State<Spalsh_Screen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
            () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => login_signup())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQueryConstants.isSmallHight(context) *0.2,),
              child: Image.asset(
                'assets/logo/enjoy4.png.png',
                // height: MediaQueryConstants.isSmallHight(context) * 1,
              ),
            ),
            CircularProgressIndicator(),
          ],
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeeksForGeeks")),
      body: Center(
          child: Text(
            "Home page",
            textScaleFactor: 2,
          )),
    );
  }
}
