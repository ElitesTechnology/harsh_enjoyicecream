import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:harsh_enjoyicecream/aaaaaaa.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

import '../../constants/mediaquery.dart';

class signup_e extends StatefulWidget {
  @override
  State<signup_e> createState() => _signup_eState();
}

class _signup_eState extends State<signup_e> {
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Image(
    //         image: AssetImage(
    //           "assets/logo/ice.jpg",
    //         ),
    //         width: MediaQuery.of(context).size.width,
    //         height: MediaQuery.of(context).size.height,
    //         fit: BoxFit.cover,
    //       ),
    //       Center(
    //         child: Stack(
    //           children: [
    //             Container(
    //               color: Color(0x8E7A7878),
    //               height:_height*0.45,
    //               width: _width*0.7,
    //               child: Padding(
    //                 padding: EdgeInsets.all(_height*0.04),
    //                 child: Column(
    //                   children: [
    //                     Column(
    //                       children: [
    //                         TextField(
    //                           controller: email,
    //                           keyboardType: TextInputType.emailAddress,
    //                           decoration: InputDecoration(
    //                               border: OutlineInputBorder(
    //                                 borderRadius: BorderRadius.circular(8.0),
    //                                 borderSide: BorderSide.none,
    //                               ),
    //                               filled: true,
    //                               fillColor: Color(0xFFe7edeb),
    //                               hintText: 'Username',
    //                               prefixIcon: Icon(
    //                                 Icons.account_circle_sharp,
    //                                 color: Colors.grey[600],
    //                               )
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: _height*0.01,
    //                         ),
    //                         TextField(
    //                           controller: pass,
    //                           keyboardType: TextInputType.emailAddress,
    //                           decoration: InputDecoration(
    //                               border: OutlineInputBorder(
    //                                 borderRadius: BorderRadius.circular(8.0),
    //                                 borderSide: BorderSide.none,
    //                               ),
    //                               filled: true,
    //                               fillColor: Color(0xFFe7edeb),
    //                               hintText: 'Password',
    //                               prefixIcon: Icon(
    //                                 Icons.account_circle_sharp,
    //                                 color: Colors.grey[600],
    //                               )
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: MediaQueryConstants.isSmallHight(context)*0.04,
    //                         ),
    //                         AnimatedButton(
    //                           // animationDuration: Duration(seconds: 3),
    //                           height: _height*0.05,
    //                           width: _width*0.3,
    //                           text: 'Sign Up',
    //                           textStyle: TextStyle(color:  Color(0xFC060709),fontWeight: FontWeight.bold,fontSize: 16),
    //                           isReverse: true,
    //                           selectedTextColor: Colors.white,
    //                           selectedBackgroundColor: Colors.black87,
    //                           transitionType: TransitionType.LEFT_CENTER_ROUNDER,
    //                           backgroundColor: Colors.white,
    //                           borderRadius: 20,
    //                           borderWidth: 5,
    //                           borderColor: Color(0xFCC07CA9),
    //                           onPress: (){
    //                             sighUp();
    //                           },
    //                         ),
    //                         Row(
    //                           children: [
    //                             Padding(
    //                                 padding: EdgeInsets.only(top: _height*0.03,left: _width*0.07),
    //                                 child: SignInButton.mini(
    //                                   buttonType: ButtonType.google,
    //                                   onPressed: (){},
    //                                 ),
    //                             ),
    //                             Padding(
    //                               padding: EdgeInsets.only(top: _height*0.03,left: _width*0),
    //                               child: IconButton(
    //                                 onPressed: (){
    //                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    //                                      return My_phone();
    //                                    }));
    //                                 },
    //                                 icon: Icon(Icons.call),
    //                               )
    //                             ),
    //                           ],
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
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
            child: Container(
              color: Color(0x8E7A7878),
              height: _height * 0.5,
              width: _width * 0.7,
              child: Padding(
                padding: EdgeInsets.all(_height * 0.04),
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    TextField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFe7edeb),
                          hintText: 'Username',
                          prefixIcon: Icon(
                            Icons.account_circle_sharp,
                            color: Colors.grey[600],
                          )),
                    ),
                    SizedBox(
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
                          fillColor: Color(0xFFe7edeb),
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.account_circle_sharp,
                            color: Colors.grey[600],
                          )),
                    ),
                    SizedBox(height: 20,),
                    AnimatedButton(
                      // animationDuration: Duration(seconds: 3),
                      height: _height * 0.05,
                      width: _width * 0.3,
                      text: 'Sign Up',
                      textStyle: TextStyle(
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
                      borderColor: Color(0xFCC07CA9),
                      onPress: () {
                        sighUp();
                      },
                    ),
                    SizedBox(
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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return My_phone();
                            }));
                          },
                          icon: Icon(Icons.call),
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
      MaterialPageRoute(builder: (context) => Home_Screen()),
    );
  }
}
