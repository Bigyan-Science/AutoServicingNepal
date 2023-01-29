// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:autoservicingnepal/Homepage/Homepage.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class KtmPage extends StatefulWidget {
  const KtmPage({super.key});

  @override
  State<KtmPage> createState() => _KtmPageState();
}

class _KtmPageState extends State<KtmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          const SearchBar(),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Color.fromARGB(65, 183, 116, 64)),
            height: 600,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Image.asset(
                    'ktm.png',
                    height: 120,
                    width: 230,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width: 80,
                  alignment: Alignment.center,
                  child: Text(
                    '  KTM Servicing Center Nearby',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  height: 140,
                  width: 400,
                  child: Row(children: <Widget>[
                    Flexible(
                        child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 255, 255, 255)),
                      height: 140,
                      width: 140,
                      child: Image.asset(
                        'ktm.png',
                        height: 50,
                        width: 70,
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 20,
                          width: 220,
                          // color: Colors.black,
                          child: Text(
                            'KTM Service Center',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          width: 220,
                          // color: Colors.black,
                          child: Text(
                            'Maitidevi, Kathmandu',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        SizedBox(
                          height: 14,
                          width: 220,
                          // color: Colors.black,
                          child: Text(
                            'Status: Open',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(right: 100),
                          height: 30,
                          width: 200,
                          // color: Colors.black,
                          // color: Colors.black,
                          child: Image.asset(
                            'star.png',
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              // color: Colors.black,
                              height: 30,
                              width: 92,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color.fromARGB(255, 255, 119, 16)),
                              child: InkWell(
                                  onTap: (() {}),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Image.asset('call-now.png'),
                                    // SizedBox(width: 1),
                                    Text('Call Now')
                                  ])),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 30,
                              width: 98,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Color.fromARGB(255, 255, 119, 16)),
                              child: InkWell(
                                  onTap: (() {}),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Image.asset(
                                      'booking.png',
                                    ),
                                    Text(
                                      'Book Now',
                                      // style: TextStyle(fontSize: 13),
                                    )
                                  ])),
                            ),
                          ],
                        ),
                      ],
                    )),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
