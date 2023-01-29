// ignore: file_names
// ignore_for_file: prefer_const_constructors

import 'package:autoservicingnepal/Firebase/AuthenticationFireBase.dart';
import 'package:autoservicingnepal/Homepage/Homepage.dart';
import 'package:autoservicingnepal/Login_Signup/ForgotPasswordPage.dart';
import 'package:autoservicingnepal/Login_Signup/Signup.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Center(
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
            height: 10,
          ),
          Container(
            width: 200,
            height: 650,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: ListView(
              children: [
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              child: Text(
                                "Sign Up!",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 72, 0)),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => SignUp()));
                              },
                            ))),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Sign in to Continue",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Email",
                      // textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 72, 0), fontSize: 16),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(

                        // borderSide: BorderSide(color: Colors.orange)),
                        hintText: "Enter Your Email Here",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(126, 32, 32, 32))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text(
                    "Password",
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 72, 0), fontSize: 16),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    controller: _password,
                    decoration: InputDecoration(

                        // borderSide: BorderSide(color: Colors.orange)),
                        hintText: "Enter Password",
                        hintStyle:
                            TextStyle(color: Color.fromARGB(126, 32, 32, 32))),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ForgotPassWordPage()));
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Color.fromARGB(255, 153, 96, 10),
                        fixedSize: Size(0, 50),
                        backgroundColor: Color.fromARGB(255, 255, 72, 0)),
                    onPressed: () async {
                      final message = await Auth().login(
                        email: _email.text,
                        password: _password.text,
                      );
                      if (message!.contains('Successfully Logged In')) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message),
                          backgroundColor: Colors.grey,
                        ),
                      );
                    },
                    child: Text(
                      "SIGN IN",
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
