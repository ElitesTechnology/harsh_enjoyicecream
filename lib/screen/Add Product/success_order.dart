// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/screen/Add%20Product/today_order.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';
import 'package:lottie/lottie.dart';

class Success_order extends StatefulWidget {
  const Success_order({Key? key}) : super(key: key);

  @override
  State<Success_order> createState() => _Success_orderState();
}

class _Success_orderState extends State<Success_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Lottie.asset('assets/lottie/129118-done.json'),
            ),
          ),
          const Text('Your Order Is Confirmed',style: TextStyle(fontSize: 30),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return const Home_Screen();
                }));
              }, child: const Text('Home Page'),),
              const SizedBox(width: 15,),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return  Today_order();
                }));
              }, child: const Text('See Order'),),
            ],
          ),
        ],
      ),
    );
  }
}
