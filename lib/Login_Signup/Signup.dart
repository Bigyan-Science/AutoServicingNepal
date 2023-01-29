// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:autoservicingnepal/Homepage/Homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Firebase/AuthenticationFireBase.dart';
// import 'package:flutter/rendering.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _userEmail = TextEditingController();
  final TextEditingController _userNumber = TextEditingController();
  final TextEditingController _userPassword = TextEditingController();
  bool? click = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Container(
              height: 100,
              width: 80,
              alignment: Alignment.center,
              child: Image.asset('assets/logo.png')),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 200,
            height: 650,
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      "Full Name",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 72, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: TextField(
                    controller: _userName,
                    decoration:
                        InputDecoration(hintText: "Enter your full name"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: Text(
                    "Email Address",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 72, 0),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: TextField(
                    controller: _userEmail,
                    decoration: InputDecoration(

                        // borderSide: BorderSide(color: Colors.orange)),
                        hintText: "Enter your Email address",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(126, 32, 32, 32))),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      "Phone Number",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 72, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: TextField(
                    controller: _userNumber,
                    decoration: InputDecoration(

                        // borderSide: BorderSide(color: Colors.orange)),
                        hintText: "Enter your Phone Number",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(126, 32, 32, 32))),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: Text(
                      "Password",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 72, 0),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 15),
                  child: TextField(
                    controller: _userPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () => setState(() {
                            click = false;
                          }),
                          icon: click == false
                              ? const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                ),
                        ),
                        hintText: "Enter your password",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(126, 32, 32, 32))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 153, 96, 10),
                        fixedSize: Size(200, 50),
                        backgroundColor: Color.fromARGB(255, 255, 72, 0)),
                    onPressed: () async {
                      final message = await Auth().userRegistration(
                        email: _userEmail.text,
                        password: _userPassword.text,
                      );
                      if (message!
                          .contains('Account was successfully created')) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const HomePage()));
                      }
                      FirebaseFirestore.instance
                          .collection('Users')
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .set({
                        'Name': _userName.text,
                        'UserEmail': _userEmail.text,
                        'PhoneNumber': _userNumber.text
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: Colors.grey,
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
