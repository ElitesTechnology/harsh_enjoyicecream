import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:harsh_enjoyicecream/bbbbbbb.dart';
import 'package:harsh_enjoyicecream/constants/mediaquery.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class My_phone extends StatefulWidget {
  const My_phone({Key? key}) : super(key: key);

  static String verify = '';

  @override
  State<My_phone> createState() => _My_phoneState();
}

class _My_phoneState extends State<My_phone> {
  TextEditingController code = TextEditingController();

  var phone = '';

  @override
  void initState() {
    code.text = '  +91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(
              "assets/logo/ice.jpg",
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  color: Color(0x8E7A7878),
                  height: _height * 0.45,
                  width: _width * 0.7,
                  child: Padding(
                    padding: EdgeInsets.all(_height * 0.04),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            TextField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFe7edeb),
                                  hintText: 'Mobile Number',
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey[600],
                                  )),
                            ),
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFe7edeb),
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.account_circle_sharp,
                                    color: Colors.grey[600],
                                  )),
                            ),
                            SizedBox(
                              height:
                                  MediaQueryConstants.isSmallHight(context) *
                                      0.04,
                            ),
                            AnimatedButton(
                              // animationDuration: Duration(seconds: 3),
                              height: _height * 0.05,
                              width: _width * 0.3,
                              text: 'get otp',
                              textStyle: TextStyle(
                                  color: Color(0xFC060709),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                              isReverse: true,
                              selectedTextColor: Colors.white,
                              selectedBackgroundColor: Colors.black87,
                              transitionType:
                                  TransitionType.LEFT_CENTER_ROUNDER,
                              backgroundColor: Colors.white,
                              borderRadius: 20,
                              borderWidth: 5,
                              borderColor: Color(0xFCC07CA9),
                              onPress: () async{
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                  phoneNumber: '${code.text+phone}',
                                  verificationCompleted: (PhoneAuthCredential credential) {},
                                  verificationFailed: (FirebaseAuthException e) {},
                                  codeSent: (String verificationId, int? resendToken) {
                                    My_phone.verify=verificationId;
                                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
                                      return My_otp();
                                    }));
                                  },
                                  codeAutoRetrievalTimeout: (String verificationId) {},
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
