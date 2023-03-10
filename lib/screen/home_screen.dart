import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/screen/new_contact.dart';
import '../constants/mediaquery.dart';
import '../navigations_screens/new_order.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 2);

  int maxCount = 5;

  /// widget list
  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    counter(),
    const Page4(),
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
        actions: [
          Padding(
            padding: EdgeInsets.only(left: MediaQueryConstants.isSmallScreen(context) * 0.2),
            child: IconButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return New_Contact();
              }));
            }, icon: Icon(Icons.perm_contact_cal_rounded)),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm'),
              onTap: () {
                // TODO: implement item 1 action
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // TODO: implement item 2 action
              },
            ),
            Divider(),
            ListTile(
              title: Text('Close Drawer'),
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
        bottomBarItems: [
          const BottomBarItem(
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
          const BottomBarItem(
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
          const BottomBarItem(
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
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.restaurant_menu_outlined,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.restaurant_menu_outlined,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 5',
          ),const BottomBarItem(
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

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}


class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
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