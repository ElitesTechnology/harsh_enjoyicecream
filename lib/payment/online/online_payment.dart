import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class online_payment extends StatefulWidget {
  const online_payment({Key? key}) : super(key: key);

  @override
  State<online_payment> createState() => _online_paymentState();
}

class _online_paymentState extends State<online_payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Billing').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Online Payment"),
              );
            } else {
              var data = snapshot.data!.docs;
              print(data);
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    print(data[index]['payment_mode']);
                    // print(selectedDate);
                    if (data[index]['payment_mode'] == 'Online Payment') {
                      return Card(
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: ListTile(
                            title: Text("${data[index]['payment']}"),
                            subtitle: Text("${data[index]['payment_mode']}"),
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
          }
      ),
    );
  }
}
