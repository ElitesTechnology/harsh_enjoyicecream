import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:harsh_enjoyicecream/My_phone.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class login_e extends StatefulWidget{
  @override
  State<login_e> createState() => _login_eState();
}

class _login_eState extends State<login_e> {

  var email = TextEditingController();
  var pass = TextEditingController();

  GoogleSignIn googleSignIn = GoogleSignIn();
  bool isSignin = false;

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
            child: Container(
              color: Color(0x8E7A7878),
              height:_height*0.5,
              width: _width*0.7,
              child: Padding(
                padding: EdgeInsets.all(_height*0.04),
                child: Column(
                  children: [
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
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: pass,
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xfff3faf8),
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.grey[600],
                          )
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Text(
                        'Forgot password?',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    AnimatedButton(
                      // animationDuration: Duration(seconds: 3),
                      height: _height*0.05,
                      width: _width*0.3,
                      text: 'LogIn',
                      textStyle: TextStyle(color:  Color(0xFC060709),fontWeight: FontWeight.bold,fontSize: 16),
                      isReverse: true,
                      selectedTextColor: Colors.white,
                      selectedBackgroundColor: Colors.black87,
                      transitionType: TransitionType.LEFT_CENTER_ROUNDER,
                      backgroundColor: Colors.white,
                      borderRadius: 20,
                      borderWidth: 2,
                      onPress: (){
                        sighIn();
                        //   Navigator.push(
                        //       context, MaterialPageRoute(builder: (context) => App()));
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
                          onPressed: (){},
                        ),
                        IconButton(
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
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


  _signOut() async{
    await googleSignIn.signOut();
    setState(() {
      isSignin = false;
    });
  }

  Future<void> _signIn() async {
    try {
      await googleSignIn.signIn();
      setState(() {
        isSignin = true;
        Home_Screen();
      });
    } catch (e) {
      print(e);
    }
  }

  sighIn() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: pass.text);
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home_Screen()),
    );
  }


}