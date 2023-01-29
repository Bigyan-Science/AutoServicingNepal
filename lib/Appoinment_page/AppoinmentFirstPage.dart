// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:autoservicingnepal/Appoinment_page/AppoinmentSecondPage.dart';
import 'package:autoservicingnepal/Brand_Page/Bajaj.dart';
import 'package:autoservicingnepal/Brand_Page/Hero.dart';
import 'package:autoservicingnepal/Brand_Page/Honda.dart';
import 'package:autoservicingnepal/Brand_Page/Ktm.dart';
import 'package:autoservicingnepal/Brand_Page/Yamaha.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/Login_Signup/Signup.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class AppointmentFirstPage extends StatefulWidget {
  AppointmentFirstPage({super.key, required this.productId});
  String? productId;

  @override
  State<AppointmentFirstPage> createState() => _AppointmentFirstPageState();
}

class _AppointmentFirstPageState extends State<AppointmentFirstPage> {
  String? brand;
  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: ListView(children: [
        const SearchBar(),
        Container(
          height: 630,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color.fromARGB(255, 255, 251, 243),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Book Appointment",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text(
                  "Book from your finger tips",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey),
                ),
              ),
              Container(
                height: 350,
                width: 380,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10, left: 20),
                      alignment: Alignment.centerLeft,

                      // padding: const EdgeInsets.only(

                      child: Text(
                        " Select Brand ",
                        // textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),

                    RadioListTile(
                      title: Row(
                        children: <Widget>[
                          Image.asset(
                            "Yamaha.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Text("Yamaha"),
                        ],
                      ),
                      value: "YAMAHA",
                      groupValue: brand,
                      onChanged: (value) {
                        setState(() {
                          brand = value.toString();
                        });
                      },
                    ),

                    // ********************************Yamaha************8******************
                    Divider(
                      height: 2,
                      color: Color.fromARGB(45, 0, 0, 0),
                    ),
                    RadioListTile(
                      title: Row(
                        children: <Widget>[
                          Image.asset(
                            "Bajaj.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Text("Bajaj"),
                        ],
                      ),
                      value: "BAJAJ",
                      groupValue: brand,
                      activeColor: Color.fromARGB(255, 255, 72, 0),
                      // tileColor: t,
                      onChanged: (value) {
                        setState(() {
                          brand = value.toString();
                        });
                      },
                    ),

                    // ********************************Bajaj******************************

                    Divider(
                      height: 1,
                      color: Color.fromARGB(45, 0, 0, 0),
                    ),
                    RadioListTile(
                      title: Row(
                        children: <Widget>[
                          Image.asset(
                            "hero.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Text("Hero"),
                        ],
                      ),
                      value: "HERO",
                      activeColor: Color.fromARGB(255, 255, 72, 0),
                      groupValue: brand,
                      onChanged: (value) {
                        setState(() {
                          brand = value.toString();
                        });
                      },
                    ),
                    // ********************************Hero******************************

                    Divider(
                      height: 1,
                      color: Color.fromARGB(45, 0, 0, 0),
                    ),
                    RadioListTile(
                      title: Row(
                        children: <Widget>[
                          Image.asset(
                            "honda.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Text("Honda"),
                        ],
                      ),
                      value: "Honda",
                      activeColor: Color.fromARGB(255, 255, 72, 0),
                      groupValue: brand,
                      onChanged: (value) {
                        setState(() {
                          brand = value.toString();
                        });
                      },
                    ),
                    Divider(
                      height: 2,
                      color: Color.fromARGB(108, 0, 0, 0),
                    ),
                    RadioListTile(
                      title: Row(
                        children: <Widget>[
                          Image.asset(
                            "ktm.png",
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(width: 10),
                          Text("KTM"),
                        ],
                      ),
                      value: "KTM",
                      groupValue: brand,
                      activeColor: Color.fromARGB(255, 255, 72, 0),
                      onChanged: (value) {
                        setState(() {
                          brand = value.toString();
                        });
                      },
                    ),

                    // ********************************Honda************8******************
                  ],
                ),
              ),
              SizedBox(
                // color: Colors.pink,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 251, 243),
                            side: BorderSide(color: Colors.black, width: 1)),
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
                            // color: Color.fromARGB(38, 255, 100, 4),
                            // color: Color.fromARGB(255, 255, 251, 243),
                            // color: Color.fromARGB(19, 6, 13, 217),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Text(
                            'Back',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 72, 0)
                            // side: BorderSide(color: Colors.black, width: 1)
                            ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AppointmentSecondPage(
                                    brand: brand,
                                    productId: widget.productId,
                                  )));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          child: Text(
                            'Next',
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
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: CustomBottomBar(),
    );
  }
}
