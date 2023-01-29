// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoservicingnepal/Appoinment_page/AppoinmentFirstPage.dart';
import 'package:autoservicingnepal/Appoinment_page/AppoinmentSecondPage.dart';
import 'package:autoservicingnepal/Brand_Page/Bajaj.dart';
import 'package:autoservicingnepal/Brand_Page/Hero.dart';
import 'package:autoservicingnepal/Brand_Page/Honda.dart';
import 'package:autoservicingnepal/Brand_Page/Ktm.dart';
import 'package:autoservicingnepal/Brand_Page/Yamaha.dart';
import 'package:autoservicingnepal/Map/MapPage.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/Login_Signup/Signup.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          const SearchBar(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('Banner.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Brands",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Row(children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: ClipOval(
                        child: Image.asset(
                      'honda.png',
                      fit: BoxFit.contain,
                    )),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HondaPage()));
                  },
                ),
                SizedBox(width: 15),
                Text('Honda'),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: <Widget>[
                InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 35,
                      child: ClipOval(
                          child: Image.asset(
                        'hero.png',
                        fit: BoxFit.contain,
                      )),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HeroPage()));
                    }),
                SizedBox(width: 15),
                Text('Hero'),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: ClipOval(
                        child: Image.asset(
                      'ktm.png',
                      fit: BoxFit.contain,
                    )),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => KtmPage()));
                  },
                ),
                SizedBox(width: 15),
                Text('KTM'),
              ],
            ),
            SizedBox(width: 10),
            Column(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: ClipOval(
                        child: Image.asset(
                      'Yamaha.png',
                      fit: BoxFit.fill,
                    )),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => YamahaPage()));
                  },
                ),
                SizedBox(width: 15),
                Text('Yamaha'),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: <Widget>[
                InkWell(
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: ClipOval(
                        child: Image.asset(
                      'Bajaj.png',
                      fit: BoxFit.fill,
                    )),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => BajajPage()));
                  },
                ),
                SizedBox(width: 15),
                Text('Bajaj'),
              ],
            ),
          ]),
          SizedBox(
            width: 200,
            height: 300,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WorkshopNearbyPage()));
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 153, 96, 10),
                        fixedSize: Size(0, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Nearby Workshops',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 110,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 153, 96, 10),
                        fixedSize: Size(0, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Select Service',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppointmentFirstPage(
                                productId: '',
                              )));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 153, 96, 10),
                        fixedSize: Size(0, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Book an Appointment',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 88,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppointmentFirstPage(
                                productId: '',
                              )));
                    },
                  ),
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
