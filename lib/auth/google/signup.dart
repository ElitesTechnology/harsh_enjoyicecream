// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';
import 'package:sign_button/sign_button.dart';

class signup_e extends StatefulWidget {
  const signup_e({super.key});

  @override
  State<signup_e> createState() => _signup_eState();
}

class _signup_eState extends State<signup_e> {
  var email = TextEditingController();
  var pass = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

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
          Center(
            child: Container(
              color: const Color(0x8E7A7878),
              height: height * 0.5,
              width: width * 0.7,
              child: Padding(
                padding: EdgeInsets.all(height * 0.04),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFe7edeb),
                          hintText: 'Username',
                          prefixIcon: Icon(
                            Icons.account_circle_sharp,
                            color: Colors.grey[600],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: pass,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: const Color(0xFFe7edeb),
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.account_circle_sharp,
                            color: Colors.grey[600],
                          )),
                    ),
                    const SizedBox(height: 20,),
                    AnimatedButton(
                      // animationDuration: Duration(seconds: 3),
                      height: height * 0.05,
                      width: width * 0.3,
                      text: 'Sign Up',
                      textStyle: const TextStyle(
                          color: Color(0xFC060709),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      isReverse: true,
                      selectedTextColor: Colors.white,
                      selectedBackgroundColor: Colors.black87,
                      transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                      backgroundColor: Colors.white,
                      borderRadius: 20,
                      borderWidth: 5,
                      borderColor: const Color(0xFCC07CA9),
                      onPress: () {
                        sighUp();
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton.mini(
                          buttonType: ButtonType.google,
                          onPressed: () {},
                        ),
                        IconButton(
                          onPressed: () {

                          },
                          icon: const Icon(Icons.call),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  sighUp() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email.text, password: pass.text);
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home_Screen()),
    );
  }
}
