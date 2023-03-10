
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/mediaquery.dart';

class counter extends StatefulWidget {
  @override
  State<counter> createState() => _counterState();
}

class _counterState extends State<counter> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQueryConstants.isSmallScreen(context) * 0.05,
            top: MediaQueryConstants.isSmallScreen(context) * 0.03,
          ),
          child: Container(
            height: MediaQueryConstants.isSmallScreen(context) * 0.5,
            width: MediaQueryConstants.isSmallScreen(context) * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              gradient: LinearGradient(
                colors: [
                  Color(0xC8F4F4F5),
                  Color(0xC3F4F4F5),
                  Color(0xD5F4F4F5),
                  Color(0xFCF4F4F5),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Color(0x7B060709),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.green,
                    size: MediaQueryConstants.isSmallScreen(context) * 0.09,
                  ),
                ),
                Text("NEW ORDER"),
              ],
            ),
          ),
        ),
        Center(child: Text("No Table Order")),
      ],
    );
  }
}
