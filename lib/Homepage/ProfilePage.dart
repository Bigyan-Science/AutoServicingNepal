// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoservicingnepal/Appoinment_page/AppointmentViewPage.dart';
import 'package:autoservicingnepal/Appoinment_page/Appointment.dart';
import 'package:autoservicingnepal/Appoinment_page/AppointmentNull.dart';
import 'package:autoservicingnepal/Firebase/AuthenticationFireBase.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:autoservicingnepal/wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> signOut() async {
    await Auth().signOut();
  }

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

  @override
  Widget build(BuildContext context) {
    fetchUserName();
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 5,
              ),
              Container(
                // color: Color.fromARGB(255, 255, 251, 243),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 70,
                    child: ClipOval(
                        child: Image.asset(
                      'logo.png',
                      fit: BoxFit.contain,
                    )),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              Column(children: [
                Center(
                  child: Text(
                    '${name}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Text(
                    '${email}',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            height: 300,
            color: Color.fromARGB(255, 255, 251, 243),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.edit),
                  title: Text('Edit Profile'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AppointmentViewPage()));
                  },
                ),
                Divider(),
                ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Appointments History'),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AppointmentViewPage()));
                    }),
                Divider(),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Succesfully Logged Out'),
                        backgroundColor: Colors.grey,
                      ),
                    );
                    signOut();

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Wrapper()));
                  },
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}
