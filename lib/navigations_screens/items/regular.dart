import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Regular extends StatefulWidget {
  @override
  State<Regular> createState() => _RegularState();
}

class _RegularState extends State<Regular> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _vname = TextEditingController();
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
          onPressed: () {},
          icon: Icon(
            Icons.search_rounded,
          ),
        ),
        backgroundColor: Color(0x25f57eb8),
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle: TextStyle(color: Colors.white),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (temp) {
            setState(() {
              _searchText = temp.toLowerCase();
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          final item = _items[index];
          if (_searchText.isEmpty || item.toLowerCase().contains(_searchText)) {
            return ListTile(title: Text(item));
          } else {
            return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Column(
                    children: [
                      SizedBox(
                        height: _height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(actions: [
                            SizedBox(
                              height: _height * 0.02,
                            ),
                            TextField(
                              controller: _vname,
                              decoration: InputDecoration(
                                hintText: 'Ex 500gm,Blue,1Kg,1ltr',
                                border: OutlineInputBorder(),
                                labelText: 'Variant Name',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (str) {
                                temp = str;
                              },
                            ),
                            SizedBox(
                              height: _height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cencal'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _items.add(temp!);
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text('Save'),
                                ),
                              ],
                            ),
                          ]),
                        ),
                        child: Container(
                          height: _height * 0.15,
                          width: _width * 0.7,
                          child: Center(
                            child: Container(
                              height: _height * 0.25,
                              width: _width * 0.92,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xf4f57eb8),
                                    Color(0xaef57eb8),
                                    Color(0xd0f57eb8),
                                    Color(0xf4f57eb8),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 10),
                                    blurRadius: 10,
                                    color: Color(0x996E6F72),
                                  ),
                                ],
                              ),
                              child: Center(
                                  child: TextButton(
                                    child: Text(
                                      "Raguler",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    onPressed: () {},
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('weekly');
                            },
                            child: Container(
                              height: _height * 0.3,
                              width: _width * 0.45,
                              child: Center(
                                child: Container(
                                  height: _height * 0.25,
                                  width: _width * 0.92,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xf4f57eb8),
                                        Color(0xaef57eb8),
                                        Color(0xd0f57eb8),
                                        Color(0xf4f57eb8),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 10,
                                        color: Color(0x996E6F72),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: TextButton(
                                        child: Text(
                                          "Weekly",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: () {},
                                      )),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Monthly');
                            },
                            child: Container(
                              height: _height * 0.3,
                              width: _width * 0.45,
                              child: Center(
                                child: Container(
                                  height: _height * 0.25,
                                  width: _width * 0.92,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xf4f57eb8),
                                        Color(0xaef57eb8),
                                        Color(0xd0f57eb8),
                                        Color(0xf4f57eb8),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(0, 10),
                                        blurRadius: 10,
                                        color: Color(0x996E6F72),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: TextButton(
                                          child: Text(
                                            "Monthly",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {})),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            }),
        backgroundColor: Color(0x86f57eb8),
        onPressed: () {},
      ),
    );
  }
}
