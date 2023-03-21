// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/screen/Add%20Product/sub_category.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';

class Add_Category extends StatefulWidget {
  const Add_Category({Key? key}) : super(key: key);

  @override
  State<Add_Category> createState() => _Add_CategoryState();
}

class _Add_CategoryState extends State<Add_Category> {
  TextEditingController sampledata1 = TextEditingController();
  List? deldate;
  var id;

  String? temp;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x86f57eb8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home_Screen(),
                ));
          },
        ),
        title: const Text("New Order"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: IconButton(
      //       icon: Icon(Icons.add),
      //       onPressed: () {
      //         showDialog(
      //           context: context,
      //           builder: (BuildContext context) {
      //             return AlertDialog(
      //               title: TextField(
      //                 controller: sampledata1,
      //                 decoration: InputDecoration(
      //                   hintText: '',
      //                   border: OutlineInputBorder(),
      //                   labelText: 'Product Name',
      //                 ),
      //                 textInputAction: TextInputAction.next,
      //                 onChanged: (str) {
      //                   temp = str;
      //                 },
      //               ),
      //               content: Text('Are you sure ?'),
      //               actions: <Widget>[
      //                 ElevatedButton(
      //                   onPressed: () {
      //                     Navigator.of(context).pop();
      //                     sampledata1.clear();
      //                   },
      //                   child: Text('No'),
      //                 ),
      //                 ElevatedButton(
      //                   onPressed: () async {
      //                     setState(() {
      //                       _items.add(temp!);
      //                     });
      //                     Map<String, dynamic> data = {
      //                       "P_Name": sampledata1.text,
      //                       'subcat':[]
      //                     };
      //                     FirebaseFirestore.instance
      //                         .collection("Add Product")
      //                         .add(data);
      //                     Navigator.pop(context);
      //                     sampledata1.clear();
      //                   },
      //                   child: Text('Yes'),
      //                 ),
      //               ],
      //             );
      //           },
      //         );
      //       }),
      //   backgroundColor: Color(0x86f57eb8),
      //   onPressed: () {},
      // ),
      // body: StreamBuilder(
      //   stream:
      //       FirebaseFirestore.instance.collection('Add Product').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Text("No Value.");
      //     }
      //     // return ListView.builder(
      //     //   itemCount: _items.length,
      //     //   itemBuilder: (context, index) {
      //     //
      //     //       return Container(
      //     //         child: Column(
      //     //           children: snapshot.data!.docs.map((e) {
      //     //             return Container(
      //     //               height: 50,
      //     //               width: 50,
      //     //               color: Colors.blue,
      //     //               child: Text(e['P_Name']),
      //     //             );
      //     //           }).toList(),
      //     //         ),
      //     //       );
      //     //     }
      //     // );
      //     return GridView.builder(
      //       itemCount: _items.length,
      //       gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: 2),
      //       itemBuilder: (BuildContext context, int index) {
      //         return Stack(
      //           children: snapshot.data!.docs.map((e) {
      //             return  Card(
      //               child: new GridTile(
      //                 child: Center(
      //                   child: Text(e['P_Name']),
      //                 ), //just for testing, will fill with image later
      //               ),
      //             );
      //           }).toList(),
      //         );
      //       },
      //     );
      //     return GridView.builder(
      //         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //             maxCrossAxisExtent: 200,
      //             childAspectRatio: 1 / 3,
      //             crossAxisSpacing: 20,
      //             mainAxisSpacing: 20),
      //         itemCount: _items.length,
      //         itemBuilder: (context, index) {
      //           return Container(
      //             child: Column(
      //               children: snapshot.data!.docs.map((e) {
      //                 return Container(
      //                   height: 50,
      //                   width: 50,
      //                   color: Colors.blue,
      //                   child: Text(e['P_Name']),
      //                 );
      //               }).toList(),
      //             ),
      //           );
      //         });
      //     // return ListView(
      //     //   children: snapshot.data!.docs.map((e) {
      //     //     return ListTile(title: Text(e['field1']),);
      //     //   }).toList(),
      //     // );
      //   },
      // ),
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
                            onTap: () {
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
}
