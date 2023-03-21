// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../constants/mediaquery.dart';

class New_Contact extends StatefulWidget {
  const New_Contact({Key? key}) : super(key: key);

  @override
  State<New_Contact> createState() => _New_ContactState();
}

class _New_ContactState extends State<New_Contact> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  TextEditingController dateInput = TextEditingController();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController notes = TextEditingController();
  TextEditingController phone = TextEditingController();

  final List<String> _items = [];
  String? temp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x86f57eb8),
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Home_Screen();
            }));
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("ADD CUSTOMER"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Add Customer"),
                    content: const Text('Are you sure ?'),
                    actions: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          phone.clear();
                          name.clear();
                          email.clear();
                          address.clear();
                          notes.clear();
                        },
                        child: const Text('No'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            _items.add(temp!);
                          });
                          Map<String, dynamic> data = {
                            "C_Name": name.text,
                            "C_Email": email.text,
                            "C_Add": address.text,
                            "C_Notes": notes.text,
                            "C_Phone": phone.text,
                          };
                          FirebaseFirestore.instance
                              .collection("Add Customer")
                              .add(data);
                          DocumentSnapshot variable = await FirebaseFirestore
                              .instance
                              .collection('Add Customer')
                              .doc('Customer')
                              .get();
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                            return const Home_Screen();
                          }));
                          phone.clear();
                          name.clear();
                          email.clear();
                          address.clear();
                          notes.clear();
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  );
                },
              );
              // setState(() {
              //   _items.add(temp!);
              // });
              // Map<String, dynamic> data = {
              //   "C_Name": name.text,
              //   "C_Email": email.text,
              //   "C_Add": address.text,
              //   "C_Notes": notes.text,
              //   "C_Phone":phone.text,
              // };
              // FirebaseFirestore.instance.collection("Add Customer").add(data);
              // DocumentSnapshot variable = await FirebaseFirestore.instance
              //     .collection('Add Customer')
              //     .doc('Customer')
              //     .get();
            },
            child: const Text(
              "Save",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQueryConstants.isSmallScreen(context) * 0.05,
                    top: MediaQueryConstants.isSmallScreen(context) * 0.03,
                  ),
                  child: Container(
                    height: MediaQueryConstants.isSmallScreen(context) * 0.7,
                    width: MediaQueryConstants.isSmallScreen(context) * 0.9,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xC8F4F4F5),
                          Color(0xC3F4F4F5),
                          Color(0xD5F4F4F5),
                          Color(0xFCF4F4F5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     offset: Offset(0, 10),
                      //     blurRadius: 10,
                      //     color: Color(0x7B060709),
                      //   ),
                      // ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("CUSTOMER DETAILS"),
                        const Divider(),
                        InternationalPhoneNumberInput(
                          onInputChanged: (str) {
                            temp = str as String;
                          },
                          onInputValidated: (bool value) {
                            if (kDebugMode) {
                              print(value);
                            }
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: const TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: phone,
                          formatInput: true,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            if (kDebugMode) {
                              print('On Saved: $number');
                            }
                          },
                        ),
                        const Divider(),
                        TextField(
                          controller: name,
                          onChanged: (str) {
                            temp = str;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Full Name',
                          ),
                        ),
                        const Divider(),
                        TextField(
                          controller: email,
                          onChanged: (str) {
                            temp = str;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email Address',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(
                //     left: MediaQueryConstants.isSmallScreen(context) * 0.05,
                //     top: MediaQueryConstants.isSmallScreen(context) * 0.03,
                //   ),
                //   child: Container(
                //     height: MediaQueryConstants.isSmallScreen(context) * 0.6,
                //     width: MediaQueryConstants.isSmallScreen(context) * 0.9,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         topLeft: Radius.circular(20),
                //         topRight: Radius.circular(20),
                //         bottomRight: Radius.circular(20),
                //         bottomLeft: Radius.circular(20),
                //       ),
                //       gradient: LinearGradient(
                //         colors: [
                //           Color(0xC8F4F4F5),
                //           Color(0xC3F4F4F5),
                //           Color(0xD5F4F4F5),
                //           Color(0xFCF4F4F5),
                //         ],
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //       ),
                //       // boxShadow: [
                //       //   BoxShadow(
                //       //     offset: Offset(0, 10),
                //       //     blurRadius: 10,
                //       //     color: Color(0x7B060709),
                //       //   ),
                //       // ],
                //     ),
                //     child: Column(
                //       children: [
                //         SizedBox(
                //           height: 10,
                //         ),
                //         Text("GENERAL DETAILS"),
                //         Divider(),
                //         TextField(
                //             controller: dateInput,
                //             decoration: InputDecoration(
                //                 icon: Icon(Icons.calendar_today),
                //                 labelText: "Date of Order"),
                //             readOnly: true,
                //             onTap: () async {
                //               DateTime? pickedDate = await showDatePicker(
                //                   context: context,
                //                   initialDate: DateTime.now(),
                //                   firstDate: DateTime(1950),
                //                   lastDate: DateTime(2100));
                //
                //               if (pickedDate != null) {
                //                 print(pickedDate);
                //                 String formattedDate =
                //                     DateFormat('yyyy-MM-dd').format(pickedDate);
                //                 print(formattedDate);
                //                 setState(() {
                //                   dateInput.text = formattedDate;
                //                 });
                //               } else {}
                //             }),
                //         Divider(),
                //         TextField(
                //             controller: dateInput,
                //             decoration: InputDecoration(
                //                 icon: Icon(Icons.calendar_today),
                //                 labelText: "Delhivery"),
                //             readOnly: true,
                //             onTap: () async {
                //               DateTime? pickedDate = await showDatePicker(
                //                   context: context,
                //                   initialDate: DateTime.now(),
                //                   firstDate: DateTime(1950),
                //                   lastDate: DateTime(2100));
                //
                //               if (pickedDate != null) {
                //                 print(pickedDate);
                //                 String formattedDate =
                //                     DateFormat('yyyy-MM-dd').format(pickedDate);
                //                 print(formattedDate);
                //                 setState(() {
                //                   dateInput.text = formattedDate;
                //                 });
                //               } else {}
                //             }),
                //       ],
                //     ),
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQueryConstants.isSmallScreen(context) * 0.05,
                    top: MediaQueryConstants.isSmallScreen(context) * 0.03,
                  ),
                  child: Container(
                    height: MediaQueryConstants.isSmallScreen(context) * 0.7,
                    width: MediaQueryConstants.isSmallScreen(context) * 0.9,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Color(0xC8F4F4F5),
                          Color(0xC3F4F4F5),
                          Color(0xD5F4F4F5),
                          Color(0xFCF4F4F5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      // boxShadow: [
                      //   BoxShadow(
                      //     offset: Offset(0, 10),
                      //     blurRadius: 10,
                      //     color: Color(0x7B060709),
                      //   ),
                      // ],
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text("OTHER DETAILS"),
                        const Divider(),
                        TextField(
                          onChanged: (str) {
                            temp = str;
                          },
                          controller: address,
                          maxLines: 3,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Address',
                          ),
                        ),
                        const Divider(),
                        TextField(
                          onChanged: (str) {
                            temp = str;
                          },
                          controller: notes,
                          maxLines: 2,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Notes',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
