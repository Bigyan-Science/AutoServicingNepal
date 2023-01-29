// ignore_for_file: prefer_const_constructors, avoid_function_literals_in_foreach_calls

import 'package:autoservicingnepal/Appoinment_page/AppointmentThankYou.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

class AppointmentDateTimePage extends StatefulWidget {
  AppointmentDateTimePage(
      {super.key,
      required this.brand,
      required this.selectedServiceType,
      required this.productId});
  String? brand;
  String? selectedServiceType;
  String? productId;

  @override
  _AppointmentDateTimePageState createState() =>
      _AppointmentDateTimePageState();
}

class _AppointmentDateTimePageState extends State<AppointmentDateTimePage> {
  String? name;
  String? email;
  void fetchUserName() async {
    User uid = await FirebaseAuth.instance.currentUser!;
    if (uid != null) {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      setState(() {
        name = snapshot['Name'];
        email = snapshot['UserEmail'];
      });
    }
  }

  String selectedDate = DateFormat.yMMMd().format(DateTime.now()).toString();
  final List<String> timeSlots = [
    "09:00 AM",
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "01:00 PM",
    "02:00 PM",
    "03:00 PM",
    "04:00 PM",
    "05:00 PM"
  ];
  String? selectedTimeSlot;

  @override
  Widget build(BuildContext context) {
    fetchUserName();
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: ListView(children: [
        const SearchBar(),
        Container(
          height: 1000,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 255, 251, 243),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Select Date",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    // color: Colors.white,
                  ),
                  child: CupertinoDatePicker(
                    onDateTimeChanged: (DateTime date) {
                      setState(() {
                        selectedDate =
                            DateFormat.yMMMd().format(date).toString();
                        ;
                      });
                    },
                    minimumDate: DateTime.now(),
                    initialDateTime: DateTime.now(),
                    maximumDate: DateTime.now().add(const Duration(days: 30)),
                    mode: CupertinoDatePickerMode.date,
                    dateOrder: DatePickerDateOrder.ymd,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Slots Available:",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    height: 150,
                    child: Wrap(
                      spacing: 8.0, // space between the children
                      runSpacing: 8.0, // space between the lines
                      children: List.generate(timeSlots.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedTimeSlot = timeSlots[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: selectedTimeSlot == timeSlots[index]
                                  ? Color.fromARGB(255, 255, 72, 0)
                                  : const Color.fromARGB(255, 255, 251, 243),
                            ),
                            child: Text(
                              timeSlots[index],
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedTimeSlot == timeSlots[index]
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 251, 243),
                            side: BorderSide(
                              color: Color.fromARGB(50, 0, 0, 0),
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          // color: Colors.white,
                          // alignment: Alignment.topLeft,
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Text(
                            'Back',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 72, 0)
                            // side: BorderSide(color: Colors.black, width: 1)
                            ),
                        onPressed: () {
                          if (widget.productId == '') {
                            String productIds = Uuid().v1();
                            FirebaseFirestore.instance
                                .collection("Appointment")
                                .doc(productIds)
                                .set({
                              'Name': name,
                              'Email': email,
                              'Brand Name': widget.brand,
                              'Service Type': widget.selectedServiceType,
                              'SelectedDate': selectedDate,
                              'SelectedTimeSlots': selectedTimeSlot,
                              'UserId': FirebaseAuth.instance.currentUser!.uid,
                              'productId': productIds
                            });
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AppointmentThanksPage()));
                          } else {
                            FirebaseFirestore.instance
                                .collection("Appointment")
                                .doc(widget.productId)
                                .set({
                              'Name': name,
                              'Email': email,
                              'Brand Name': widget.brand,
                              'Service Type': widget.selectedServiceType,
                              'SelectedDate': selectedDate,
                              'SelectedTimeSlots': selectedTimeSlot,
                              'UserId': FirebaseAuth.instance.currentUser!.uid,
                              'productId': widget.productId
                            });

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AppointmentThanksPage()));
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          child: Text(
                            'Book Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      // bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
