import 'package:autoservicingnepal/Appoinment_page/AppoinmentFirstPage.dart';
import 'package:autoservicingnepal/Appoinment_page/AppoinmentDateTime.dart';
import 'package:autoservicingnepal/Appoinment_page/AppoinmentSecondPage.dart';
import 'package:autoservicingnepal/Appoinment_page/AppointmentThankYou.dart';
import 'package:autoservicingnepal/Appoinment_page/AppointmentNull.dart';
import 'package:autoservicingnepal/Brand_Page/Bajaj.dart';
import 'package:autoservicingnepal/Homepage/Homepage.dart';
import 'package:autoservicingnepal/Login_Signup/Login.dart';
import 'package:autoservicingnepal/Login_Signup/Signup.dart';
import 'package:autoservicingnepal/Login_Signup/try.dart';
import 'package:autoservicingnepal/Map/MapPage.dart';

import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:autoservicingnepal/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
