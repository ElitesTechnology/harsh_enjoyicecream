
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add_Category extends StatefulWidget {
  const Add_Category({Key? key}) : super(key: key);

  @override
  State<Add_Category> createState() => _Add_CategoryState();
}

class _Add_CategoryState extends State<Add_Category> {
  TextEditingController _controller = TextEditingController();
  TextEditingController sampledata1 = TextEditingController();

  String _searchText = '';
  List<String> _items = [];
  String? temp;
  List<String> _selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text("New Order"),
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: TextField(
                      controller: sampledata1,
                      decoration: InputDecoration(
                        hintText: '',
                        border: OutlineInputBorder(),
                        labelText: 'Product Name',
                      ),
                      textInputAction: TextInputAction.next,
                      onChanged: (str) {
                        temp = str;
                      },
                    ),
                    content: Text('Are you sure ?'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _items.add(temp!);
                          });
                          Map<String, dynamic> data = {
                            "P_Name": sampledata1.text
                          };
                          FirebaseFirestore.instance
                              .collection("Add Product")
                              .add(data);
                          DocumentSnapshot variable = await FirebaseFirestore
                              .instance
                              .collection('Add Product')
                              .doc('Product Name')
                              .get();
                          Navigator.pop(context);
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            }),
        backgroundColor: Color(0x86f57eb8),
        onPressed: () {},
      ),
      body: StreamBuilder(
        stream:
        FirebaseFirestore.instance.collection('Add Product').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("No Value.");
          }
          // return ListView.builder(
          //   itemCount: _items.length,
          //   itemBuilder: (context, index) {
          //
          //       return Container(
          //         child: Column(
          //           children: snapshot.data!.docs.map((e) {
          //             return Container(
          //               height: 50,
          //               width: 50,
          //               color: Colors.blue,
          //               child: Text(e['P_Name']),
          //             );
          //           }).toList(),
          //         ),
          //       );
          //     }
          // );
          return GridView.builder(
            itemCount: _items.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: snapshot.data!.docs.map((e) {
                  return  Card(
                    child: new GridTile(
                      child: Center(
                        child: Text(e['P_Name']),
                      ), //just for testing, will fill with image later
                    ),
                  );
                }).toList(),
              );
            },
          );
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 3,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: snapshot.data!.docs.map((e) {
                      return Container(
                        height: 50,
                        width: 50,
                        color: Colors.blue,
                        child: Text(e['P_Name']),
                      );
                    }).toList(),
                  ),
                );
              });
          // return ListView(
          //   children: snapshot.data!.docs.map((e) {
          //     return ListTile(title: Text(e['field1']),);
          //   }).toList(),
          // );
        },
      ),
    );
  }
}