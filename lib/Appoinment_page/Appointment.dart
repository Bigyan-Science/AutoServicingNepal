// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:autoservicingnepal/Appoinment_page/AppoinmentDateTime.dart';
import 'package:autoservicingnepal/Appoinment_page/AppoinmentFirstPage.dart';
import 'package:autoservicingnepal/Appoinment_page/AppointmentThankYou.dart';
import 'package:autoservicingnepal/Appoinment_page/AppointmentNull.dart';
import 'package:autoservicingnepal/Homepage/Homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key, required this.snap});
  final snap;

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 255, 251, 243),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  '${widget.snap['Brand Name']}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 160,
              ),
              InkWell(
                child: Image.asset(
                  'delete.png',
                  height: 30,
                ),
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Appointment Delete ?"),
                          content: Text(
                              "Do you want to delete the selected  appointment"),
                          actions: <Widget>[
                            TextButton(
                              child: Text("Yes"),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('Appointment')
                                    .doc(widget.snap['productId'])
                                    .delete();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text("Deleted successfully")));
                              },
                            ),
                            TextButton(
                              child: Text("No"),
                              onPressed: () async {
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                },
              ),
              SizedBox(
                width: 30,
              ),
              InkWell(
                child: Image.asset(
                  'edit.png',
                  height: 30,
                ),
                onTap: () {
                  String? productId = widget.snap['productId'];
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppointmentFirstPage(
                      productId: productId,
                    ),
                  ));
                },
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text('${widget.snap['SelectedDate']}')],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${widget.snap['SelectedTimeSlots'].toString()}'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 195,
                  ),
                  InkWell(
                    onTap: () async {},
                    child: Text(
                      "Delete",
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text("Edit"),
                  SizedBox(
                    width: 15,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

showMessage(BuildContext context) {}
