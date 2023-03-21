// ignore_for_file: camel_case_types, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';

import 'confirm_order.dart';

class Sub_Category extends StatefulWidget {
  List subcat;
  var id;

  Sub_Category(this.subcat, this.id, {super.key});

  @override
  State<Sub_Category> createState() => _Sub_CategoryState();
}

class _Sub_CategoryState extends State<Sub_Category> {
  final TextEditingController _controller = TextEditingController();
  TextEditingController sampledata1 = TextEditingController();

  final List<String> _items = [];
  String? temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: TextField(
                      controller: sampledata1,
                      decoration: const InputDecoration(
                        hintText: '',
                        border: OutlineInputBorder(),
                        labelText: 'Product Name',
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (str) {
                        temp = str;
                      },
                    ),
                    content: const Text('Are you sure ?'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          sampledata1.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0x86f57eb8)),
                        child: const Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _items.add(temp!);
                          });
                          widget.subcat.add(sampledata1.text);
                          Map<String, dynamic> data = {"subcat": widget.subcat};
                          var dt = FirebaseFirestore.instance
                              .collection("Add Product")
                              .doc(widget.id)
                              .update(data);
                          Navigator.pop(context);
                          sampledata1.clear();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0x86f57eb8)),
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
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
        title: const Text("Sub Category"),
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
      //                     widget.subcat.add(sampledata1.text);
      //                     Map<String, dynamic> data = {"subcat": widget.subcat};
      //                     var dt = FirebaseFirestore.instance
      //                         .collection("Add Product")
      //                         .doc(widget.id)
      //                         .update(data);
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
      //       FirebaseFirestore.instance.collection('Add Product').doc(widget.id).snapshots(),
      //   builder: (context, snapshot) {
      //     print(snapshot.data);
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: Text("No Table Order"),
      //       );
      //     }else if(snapshot.hasError){
      //       return Center(
      //         child: Text("No Table Order"),
      //       );
      //     }
      //     else {
      //       return ListView.builder(
      //           itemCount: widget.subcat.length,
      //           itemBuilder: (context, index) {
      //             return Card(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(5.0),
      //                 child: ListTile(
      //                   onTap: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                         builder: (context) => Confirm_order(),
      //                       ),
      //                     );
      //                   },
      //                   title: Text(widget.subcat[index]),
      //                 ),
      //               ),
      //             );
      //             // return Column(
      //             //   children: snapshot.data!.docs.map((e) {
      //             //     return Card(
      //             //       child: Padding(
      //             //         padding: const EdgeInsets.all(5.0),
      //             //         child: ListTile(
      //             //           onTap: () {
      //             //             Navigator.push(context, MaterialPageRoute(
      //             //               builder: (context) => Confirm_order(),),);
      //             //           },
      //             //           title: Text(widget.subcat![index]),
      //             //         ),
      //             //       ),
      //             //     );
      //             //   }).toList(),
      //             // );
      //           });
      //     }
      //   },
      // ),
      body: ListView.builder(
          itemCount: widget.subcat.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ListTile(
                  onLongPress: () {

                  },
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Confirm_order(),
                      ),
                    );
                  },
                  title: Text(widget.subcat[index]),
                ),
              ),
            );
            // return Column(
            //   children: snapshot.data!.docs.map((e) {
            //     return Card(
            //       child: Padding(
            //         padding: const EdgeInsets.all(5.0),
            //         child: ListTile(
            //           onTap: () {
            //             Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => Confirm_order(),),);
            //           },
            //           title: Text(widget.subcat![index]),
            //         ),
            //       ),
            //     );
            //   }).toList(),
            // );
          }),
    );
  }

  deleteitem(id) {
    FirebaseFirestore.instance.collection('Add Customer').doc(id).delete();
  }
}
