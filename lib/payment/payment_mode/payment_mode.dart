import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/payment/online/online_payment.dart';

import '../../screen/home_screen.dart';
import '../../navigations_screens/items/regular.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> with SingleTickerProviderStateMixin{

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
        title: Text('Payment'),
        backgroundColor: Color(0x86f57eb8),
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
            Tab(text: 'Online'),
            Tab(text: 'Cash'),
            Tab(text: 'Baki'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          online_payment(),
          Regular(),
          Regular(),
        ],
      ),
    );
  }
}
