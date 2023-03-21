// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'sub_category.dart';

class Show_Category extends StatefulWidget {
  const Show_Category({Key? key}) : super(key: key);

  @override
  State<Show_Category> createState() => _Show_CategoryState();
}

class _Show_CategoryState extends State<Show_Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream:
          FirebaseFirestore.instance.collection('Add Product').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("No Table Order"),
              );
            }
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: snapshot.data!.docs.map((e) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            onLongPress: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Delete Contact"),
                                    content: const Text('Are you sure ?'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async{
                                          await deleteitem(
                                              snapshot.data!.docs[index].id);

                                          Navigator.pop(context);
                                        },
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            onTap: () {
                              print(snapshot.data!.docs[index].id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Sub_Category(e.get('subcat') ?? [],e.id),
                                  ));
                            },
                            title: Text(e['P_Name']),
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
    FirebaseFirestore.instance.collection('Add Product').doc(id).delete();
  }

}
