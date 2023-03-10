import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/navigations_screens/items/regular.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';

class inventory extends StatefulWidget {
  @override
  State<inventory> createState() => _inventoryState();
}

class _inventoryState extends State<inventory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('INVENTORY'),
        backgroundColor: Color(0x86f57eb8),
        centerTitle: true,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return Home_Screen();
            }));
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Raguler'),
            Tab(text: 'Weekly'),
            Tab(text: 'Monthly'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Regular(),
          Regular(),
          Regular(),
        ],
      ),
    );
  }
}
