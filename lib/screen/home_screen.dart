// ignore_for_file: camel_case_types

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/navigations_screens/items/items.dart';
import 'package:harsh_enjoyicecream/screen/new_contact.dart';
import '../navigations_screens/new_order.dart';
import '../payment/payment_mode/payment_mode.dart';
import 'Add Product/show_category.dart';
import 'Add Product/today_order.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TextEditingController sampledata1 = TextEditingController();

  final List<String> _items = [];
  String? temp;


  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 2);

  int maxCount = 5;

  /// widget list
  final List<Widget> bottomBarPages = [
     Today_order(),
    payment(),
    New_order1(),
    const Show_Category(),
    const Page5(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x86f57eb8),
        actions: [
          IconButton(
              icon: const Icon(Icons.add),
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
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0x86f57eb8)),
                          child: const Text('No'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              _items.add(temp!);
                            });
                            Map<String, dynamic> data = {
                              "P_Name": sampledata1.text,
                              'subcat':[]
                            };
                            FirebaseFirestore.instance
                                .collection("Add Product")
                                .add(data);
                            Navigator.pop(context);
                            sampledata1.clear();
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0x86f57eb8)),
                          child: const Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
              }),
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return const New_Contact();
                    }));
              },
              icon: const Icon(Icons.perm_contact_cal_rounded)),
        ],
      ),
      drawer: Drawer(
        // backgroundColor: Color(0x86f57eb8),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0x86f57eb8),
              ),
              child: Text('Welcome to \nEnjoy \nIce-Cream',style: TextStyle(fontSize: 30,color: Colors.black),),
            ),
            ListTile(
              title: const Text('Inventory Management'),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                      return inventory();
                    }));
              },
            ),
            ListTile(
              title: const Text('Payment Mode'),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return payment();
                }));
              },
            ),
            const Divider(),
            ListTile(
              title: const Text('Close Drawer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        pageController: _pageController,
        color: Colors.white,
        showLabel: false,
        notchColor: Colors.black87,
        bottomBarItems: const [
          BottomBarItem(
            inActiveItem: Icon(
              Icons.history,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.history,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.currency_rupee,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.currency_rupee,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 2',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.add,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.add,
              color: Colors.pink,
            ),
            itemLabel: 'Page 4',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.restaurant_menu_outlined,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.restaurant_menu_outlined,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 5',
          ),
          BottomBarItem(
            inActiveItem: Icon(
              Icons.more,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.more,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 5',
          ),
        ],
        onTap: (index) {
          /// control your animation using page controller
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      )
          : null,
    );
  }
}


class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 4')));
  }
}
