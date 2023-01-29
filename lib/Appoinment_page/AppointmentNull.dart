// ignore_for_file: depend_on_referenced_packages

import 'package:autoservicingnepal/Appoinment_page/AppoinmentFirstPage.dart';
import 'package:autoservicingnepal/Appoinment_page/Appointment.dart';

import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentNull extends StatefulWidget {
  const AppointmentNull({super.key});

  @override
  State<AppointmentNull> createState() => _AppointmentNullState();
}

class _AppointmentNullState extends State<AppointmentNull> {
  int _selectedIndex = 0;

  void _onSelectionChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        const SearchBar(),
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _onSelectionChanged(0),
                    child: Text(
                      'Upcoming',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            _selectedIndex == 0 ? Colors.black : Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex == 0
                          ? Colors.white
                          : const Color(0xE2E3ED),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // fixedSize: Size(100, 50),
                      backgroundColor: _selectedIndex == 1
                          ? Colors.white
                          : const Color(0xE2E3ED),
                    ),
                    onPressed: () => _onSelectionChanged(1),
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontSize: 16,
                        color:
                            _selectedIndex == 1 ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            _selectedIndex == 0
                ? Container(
                    height: 500,
                    width: 400,
                    color: const Color.fromARGB(255, 255, 251, 243),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            'searchIcon.png',
                            height: 200,
                            width: 200,
                          ),
                          Container(
                            width: 300,
                            // alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              'You have no scheduled appointments. Book One?',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 50),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 72, 0)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AppointmentFirstPage(
                                          productId: '',
                                        )));
                              },
                              child: const Text(
                                'Book Now',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                        ]))
                : Container(
                    height: 500,
                    width: 400,
                    color: const Color.fromARGB(255, 255, 251, 243),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            'oops.png',
                            height: 200,
                            width: 200,
                          ),
                          Container(
                            width: 300,
                            // alignment: Alignment.center,
                            padding: const EdgeInsets.all(20),
                            child: const Text(
                              'You have no any appointments yet. Book One?',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(100, 50),
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 72, 0)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => AppointmentFirstPage(
                                          productId: '',
                                        )));
                              },
                              child: const Text(
                                'Book Now',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )),
                        ]),
                  )
          ],
        ),
      ]),
    );
  }
}
