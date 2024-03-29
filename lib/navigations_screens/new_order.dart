import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/mediaquery.dart';
import '../screen/Add Product/add_category.dart';

class New_order1 extends StatefulWidget {
  @override
  State<New_order1> createState() => _New_order1State();
}

class _New_order1State extends State<New_order1> {
  List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder(
          stream:
          FirebaseFirestore.instance.collection('Add Customer').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("No Table Order"),
              );
            }
            // return GridView.count(
            //   crossAxisCount: 1,
            //   children: snapshot.data!.docs.map((e) {
            //     return Padding(
            //       padding: const EdgeInsets.all(10.0),
            //       child: Container(
            //           color: Colors.blue,
            //           child: Center(child: Text(e['C_Name']))),
            //     );
            //   }).toList(),
            // );
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: snapshot.data!.docs.map((e) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Delete Contact"),
                                    content: Text('Are you sure ?'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('No'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async{
                                          await deleteitem(
                                              snapshot.data!.docs[index].id);

                                          Navigator.pop(context);
                                        },
                                        child: Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Add_Category(),
                                  ));
                            },
                            leading: CircleAvatar(
                              child: Text(e['C_Name'][0]),
                            ),
                            title: Text(e['C_Name']),
                            subtitle: Text(e['C_Phone']),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                });
          }),
    );
  }

  deleteitem(id) {
    FirebaseFirestore.instance.collection('Add Customer').doc(id).delete();
  }
}
