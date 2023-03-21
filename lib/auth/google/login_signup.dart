// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:harsh_enjoyicecream/auth/google/signup.dart';

import 'login.dart';

class login_signup extends StatefulWidget{
  const login_signup({super.key});

  @override
  State<login_signup> createState() => _login_signupState();
}

class _login_signupState extends State<login_signup> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: const AssetImage(
              "assets/logo/ice.jpg",
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Container(
            height: height,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft:  Radius.elliptical(0,0),
                topRight: Radius.elliptical(0,0),
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0x03060709),
                  Color(0x56060709),
                  Color(0xC0060709),
                  Color(0xFC060709),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height*0.61,left: width*0.3),
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: height*0.05,
                color: const Color(0xddfaf7f8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height*0.7,left: width*0.13),
            child: Text(
              "Join With Ice Cream Corner",
              style: TextStyle(
                fontSize: height*0.03,
                color: const Color(0x6ffaf7f8),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height*0.8,left: width*0.15),
                child: AnimatedButton(
                  // animationDuration: Duration(seconds: 3),
                  height: height*0.07,
                  width: width*0.3,
                  text: 'LogIn',
                  textStyle: const TextStyle(color:  Color(0xFC060709),fontWeight: FontWeight.bold,fontSize: 16),
                  isReverse: true,
                  selectedTextColor: Colors.white,
                  selectedBackgroundColor: Colors.black87,
                  transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                  backgroundColor: Colors.white,
                  borderRadius: 20,
                  borderWidth: 5,
                  borderColor: const Color(0xFCC07CA9),
                  onPress: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => const login_e()));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.8,left: width*0.12),
                child: AnimatedButton(
                  // animationDuration: Duration(seconds: 3),
                  height: height*0.07,
                  width: width*0.3,
                  text: 'Sign Up',
                  textStyle: const TextStyle(color:  Color(0xFC060709),fontWeight: FontWeight.bold,fontSize: 16),
                  isReverse: true,
                  selectedTextColor: Colors.white,
                  selectedBackgroundColor: Colors.black87,
                  transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                  backgroundColor: Colors.white,
                  borderRadius: 20,
                  borderWidth: 5,
                  borderColor: const Color(0xFCC07CA9),
                  onPress: (){
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => signup_e()));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}