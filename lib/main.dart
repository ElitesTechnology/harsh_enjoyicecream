import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/My_phone.dart';
import 'package:harsh_enjoyicecream/My_otp.dart';
import 'package:harsh_enjoyicecream/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DynamicGridView(),
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

class DynamicGridView extends StatefulWidget {
  @override
  _DynamicGridViewState createState() => _DynamicGridViewState();
}

class _DynamicGridViewState extends State<DynamicGridView> {
  List<String> _items = List.generate(30, (index) => "Item $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dynamic GridView"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: _items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              print("Item $index clicked.");
            },
            child: Container(
              color: Colors.grey[200],
              child: Center(
                child: Text(_items[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
