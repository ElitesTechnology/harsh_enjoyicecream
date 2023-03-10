import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

import '../constants/mediaquery.dart';

class New_Contact extends StatefulWidget {
  const New_Contact({Key? key}) : super(key: key);

  @override
  State<New_Contact> createState() => _New_ContactState();
}

class _New_ContactState extends State<New_Contact> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = ""; //set the initial value of text field
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Home_Screen();
            }));
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("ADD CUSTOMER"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("Save",style: TextStyle(color: Colors.white),),
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
                    decoration: BoxDecoration(
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
                        SizedBox(
                          height: 10,
                        ),
                        Text("CUSTOMER DETAILS"),
                        Divider(),
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                          },
                          onInputValidated: (bool value) {
                            print(value);
                          },
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          autoValidateMode: AutovalidateMode.disabled,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          initialValue: number,
                          textFieldController: controller,
                          formatInput: true,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Full Name',
                          ),
                        ),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Email Address',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQueryConstants.isSmallScreen(context) * 0.05,
                    top: MediaQueryConstants.isSmallScreen(context) * 0.03,
                  ),
                  child: Container(
                    height: MediaQueryConstants.isSmallScreen(context) * 0.6,
                    width: MediaQueryConstants.isSmallScreen(context) * 0.9,
                    decoration: BoxDecoration(
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
                        SizedBox(
                          height: 10,
                        ),
                        Text("GENERAL DETAILS"),
                        Divider(),
                        TextField(
                            controller: dateInput,
                            decoration: InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: "Date of Order"),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateInput.text = formattedDate;
                                });
                              } else {}
                            }),
                        Divider(),
                        TextField(
                            controller: dateInput,
                            decoration: InputDecoration(
                                icon: Icon(Icons.calendar_today),
                                labelText: "Delhivery"),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(pickedDate);
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(formattedDate);
                                setState(() {
                                  dateInput.text = formattedDate;
                                });
                              } else {}
                            }),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQueryConstants.isSmallScreen(context) * 0.05,
                    top: MediaQueryConstants.isSmallScreen(context) * 0.03,
                  ),
                  child: Container(
                    height: MediaQueryConstants.isSmallScreen(context) * 0.7,
                    width: MediaQueryConstants.isSmallScreen(context) * 0.9,
                    decoration: BoxDecoration(
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
                        SizedBox(
                          height: 10,
                        ),
                        Text("OTHER DETAILS"),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'GSTIN',
                          ),
                        ),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Address',
                          ),
                        ),
                        Divider(),
                        TextField(
                          decoration: InputDecoration(
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
