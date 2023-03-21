import 'dart:math';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Today_order extends StatefulWidget {
  Today_order({super.key});

  @override
  State<Today_order> createState() => _Today_orderState();
}

class _Today_orderState extends State<Today_order> {
  String? selectedDate;
  Random random = Random();

  // var dateTime = DateTime.parse("2019-10-22 00:00:00.000");

  @override
  void initState() {
    setState(() {
      selectedDate =
          "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBar(
        backButton: false,
        white: Colors.white,
        black: Colors.black,
        accent: const Color(0x86f57eb8),
        onDateChanged: (DateTime value) => setState(() {
          selectedDate =
              "${value.year}-${NumberFormat('00').format(value.month)}-${NumberFormat('00').format(value.day)}";
        }),
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('Billing').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Table Order"),
              );
            } else {
              var data = snapshot.data!.docs;
              print(data);
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    print(data[index]['dil_date']);
                    print(selectedDate);
                    if (data[index]['dil_date'] == selectedDate) {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            title: Text("${data[index]['dil_date']}"),
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 0,
                        width: 0,
                      );
                    }
                  });
            }
          }),
    );
  }
}
