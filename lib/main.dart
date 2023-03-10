import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/aaaaaaa.dart';
import 'package:harsh_enjoyicecream/bbbbbbb.dart';
import 'package:harsh_enjoyicecream/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Spalsh_Screen(),
  ));
}

//
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: 'phone',
//       routes: {'phone': (context) => My_phone(), 'otp': (context) => My_otp(), 'home': (context) => My_page()},
//     ),
//   );
// }