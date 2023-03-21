// ignore_for_file: non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harsh_enjoyicecream/constants/mediaquery.dart';
import 'package:harsh_enjoyicecream/screen/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'success_order.dart';

// ignore: camel_case_types
class Confirm_order extends StatefulWidget {

  @override
  State<Confirm_order> createState() => _Confirm_orderState();
}

// ignore: camel_case_types
class _Confirm_orderState extends State<Confirm_order> {

  int? num1=0 , num2=0, result=0;
  add(){
    setState(() {
      num1 = int.parse(quntity.text);
      num2 = int.parse(s_price.text);
      result = num1! * num2!;
    });
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController c_name = TextEditingController();
  final TextEditingController c_address = TextEditingController();
  final TextEditingController c_phone = TextEditingController();
  final TextEditingController cat_name = TextEditingController();
  final TextEditingController pro_name = TextEditingController();
  final TextEditingController quntity = TextEditingController();
  final TextEditingController s_price = TextEditingController();
  final TextEditingController total = TextEditingController();
  final TextEditingController payment = TextEditingController();
  String? temp;
  final List<String> _items = [];

  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput1 = TextEditingController();
  String selectedValue = 'Kg';
  List<String> options = ['gram', 'Kg', 'Ltr'];
  List<String> payment_option = ['Online Payment','Cash','Baki'];
  String selectedvalue1 = 'Online Payment';

  // String total_price = (int.parse(quntity.toString()) * int.parse(s_price.toString())) as String;
  @override
  void initState() {
    dateInput.text = "";
    dateInput1.text = "";
    super.initState();
  }

  @override
  void dispose() {
    c_name.dispose();
    super.dispose();
  }

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
        title: const Text("CONFIRM ORDER"),
        centerTitle: true,
        actions: const [
          // TextButton(
          //   onPressed: () {},
          //   child: Text(
          //     "Save",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQueryConstants.isSmallScreen(context) * 0.9,
                      width: MediaQueryConstants.isSmallScreen(context) * 0.95,
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
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 5,
                            color: Color(0x4C6C6D70),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("CUSTOMER DETAILS"),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(

                              // validator: (value){
                              //   if(value == null || value.isEmpty){
                              //     return 'Please enter some text';
                              //   }
                              //   return null;
                              // },
                              controller: c_name,
                              decoration: InputDecoration(
                                hintText: 'C_Name',
                                border: OutlineInputBorder(),
                                labelText: 'Customer Name*',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              enableSuggestions: true,
                              onChanged: (str) {
                                temp = str;
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: c_address,
                              decoration: const InputDecoration(
                                hintText: 'C_Address',
                                border: OutlineInputBorder(),
                                labelText: 'Customer Address*',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (str) {
                                temp = str;
                              },
                            ),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InternationalPhoneNumberInput(
                              onInputChanged: (str) {
                                temp = str as String;
                              },
                              onInputValidated: (bool value) {},
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              ),
                              ignoreBlank: false,
                              autoValidateMode: AutovalidateMode.disabled,
                              selectorTextStyle:
                                  const TextStyle(color: Colors.black),
                              initialValue: number,
                              textFieldController: c_phone,
                              formatInput: true,
                              keyboardType: const TextInputType.numberWithOptions(
                                  signed: true, decimal: true),
                              inputBorder: const OutlineInputBorder(),
                              onSaved: (PhoneNumber number) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQueryConstants.isSmallScreen(context) * 0.99,
                      width: MediaQueryConstants.isSmallScreen(context) * 0.95,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFCF4F4F5),
                            Color(0x94F4F4F5),
                            Color(0xD5F4F4F5),
                            Color(0xFCF4F4F5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 5,
                            color: Color(0x4C6C6D70),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("GENERAL DETAILS"),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: cat_name,
                              decoration: const InputDecoration(
                                hintText: 'C_Name',
                                border: OutlineInputBorder(),
                                labelText: 'Category Name*',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (str) {
                                temp = str;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: pro_name,
                              decoration: const InputDecoration(
                                hintText: 'P_Name',
                                border: OutlineInputBorder(),
                                labelText: 'Product Name*',
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              onChanged: (str) {
                                temp = str;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                                controller: dateInput,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
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
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    setState(() {
                                      dateInput.text = formattedDate;
                                    });
                                  } else {}
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                                controller: dateInput1,
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
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
                                    String formattedDate =
                                        DateFormat('yyyy-MM-dd')
                                            .format(pickedDate);
                                    setState(() {
                                      dateInput1.text = formattedDate;
                                    });
                                  } else {}

                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQueryConstants.isSmallScreen(context) * 0.4,
                      width: MediaQueryConstants.isSmallScreen(context) * 0.95,
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
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 5,
                            color: Color(0x4C6C6D70),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Quntity"),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: quntity,
                                  decoration: const InputDecoration(
                                    hintText: 'Quntity',
                                    border: OutlineInputBorder(),
                                    labelText: 'Quntity*',
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    temp =value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              DropdownButton<String>(
                                value: selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedValue = newValue!;
                                  });
                                },
                                items: options.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          // TextField(
                          //   decoration: InputDecoration(
                          //     hintText: '0.00',
                          //     border: OutlineInputBorder(),
                          //     labelText: 'Selling Price*',
                          //   ),
                          //   keyboardType: TextInputType.phone,
                          //   textInputAction: TextInputAction.next,
                          //   onChanged: (value) {
                          //     print('Input value: $value');
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQueryConstants.isSmallScreen(context) * 0.55,
                      width: MediaQueryConstants.isSmallScreen(context) * 0.95,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFCF4F4F5),
                            Color(0x94F4F4F5),
                            Color(0xD5F4F4F5),
                            Color(0xFCF4F4F5),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 5,
                            color: Color(0x4C6C6D70),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text("Bill DETAILS"),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: s_price,
                              decoration: const InputDecoration(
                                hintText: '0.00',
                                border: OutlineInputBorder(),
                                labelText: 'Selling Price*',
                              ),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              onChanged: (str) {
                                temp = str;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              // controller: total,
                              readOnly: true,
                              decoration:  InputDecoration(
                                hintText: '$result',
                                border: OutlineInputBorder(),
                                labelText: 'Total Price*',
                              ),
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              onChanged: (str) {
                                temp = str;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQueryConstants.isSmallScreen(context) * 0.4,
                      width: MediaQueryConstants.isSmallScreen(context) * 0.95,
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
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 5,
                            color: Color(0x4C6C6D70),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Payment"),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: payment,
                                  decoration: const InputDecoration(
                                    hintText: 'Payment',
                                    border: OutlineInputBorder(),
                                    labelText: 'Payment*',
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) {
                                    temp =value;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              DropdownButton<String>(
                                value: selectedvalue1,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedvalue1 = newValue!;
                                  });
                                },
                                items: payment_option.map((String option) {
                                  return DropdownMenuItem<String>(
                                    value: option,
                                    child: Text(option),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          // TextField(
                          //   decoration: InputDecoration(
                          //     hintText: '0.00',
                          //     border: OutlineInputBorder(),
                          //     labelText: 'Selling Price*',
                          //   ),
                          //   keyboardType: TextInputType.phone,
                          //   textInputAction: TextInputAction.next,
                          //   onChanged: (value) {
                          //     print('Input value: $value');
                          //   },
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQueryConstants.isSmallScreen(context) * 0.2,
                      width: MediaQueryConstants.isSmallScreen(context) * 0.95,
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
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 5,
                            color: Color(0x4C6C6D70),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0x86f57eb8)),
                            child: const Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {});
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Confirm Order"),
                                    content: const Text('Are you sure ?'),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          c_name.clear();
                                          c_address.clear();
                                          c_phone.clear();
                                          cat_name.clear();
                                          pro_name.clear();
                                          dateInput.clear();
                                          dateInput1.clear();
                                          quntity.clear();
                                          s_price.clear();
                                          total.clear();
                                          payment.clear();
                                        },
                                        child: const Text('No'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          if(formKey.currentState!.validate()){
                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing data')));
                                          }
                                          setState(() {
                                            Navigator.pop(context);
                                            _items.add(temp!);
                                          });
                                          Map<String, dynamic> data = {
                                            "custo_name": c_name.text,
                                            "custo_address": c_address.text,
                                            "custo_phone": c_phone.text,
                                            "cat_name": cat_name.text,
                                            "pro_name": pro_name.text,
                                            "order_date": dateInput.text,
                                            "dil_date": dateInput1.text,
                                            "quntity": quntity.text,
                                            "value": selectedValue.toString(),
                                            "s_price": s_price.text,
                                            "total": total.text,
                                            "payment": payment.text,
                                            "payment_mode": selectedvalue1.toString(),
                                          };
                                          FirebaseFirestore.instance
                                              .collection("Billing")
                                              .add(data);
                                          Navigator.pop(context);
                                          c_name.clear();
                                          c_address.clear();
                                          c_phone.clear();
                                          cat_name.clear();
                                          pro_name.clear();
                                          dateInput.clear();
                                          dateInput1.clear();
                                          quntity.clear();
                                          s_price.clear();
                                          total.clear();
                                          payment.clear();
                                        },
                                        child: const Text('Yes'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0x86f57eb8)),
                            child: const Text("confirm order"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Print_Bill(title: 'abc',),));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0x86f57eb8)),
                            child: const Text("Recipt"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
