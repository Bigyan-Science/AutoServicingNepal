import 'package:autoservicingnepal/Firebase/AuthenticationFireBase.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassWordPage extends StatefulWidget {
  @override
  _ForgotPassWordPageState createState() => _ForgotPassWordPageState();
}

class _ForgotPassWordPageState extends State<ForgotPassWordPage> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _email = TextEditingController();
  String? errorMessage = '';
  Future<void> sendPasswordResetEmail() async {
    try {
      await Auth().sendPassWordResetEmail(email: _email.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Email Address",
                  // textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.orange, fontSize: 16),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _email,
                validator: (value) {
                  if (!value!.contains("@")) {
                    return "Invalid email address";
                  }
                  return null;
                },
                decoration: InputDecoration(

                    // borderSide: BorderSide(color: Colors.orange)),
                    hintText: "Enter Your Email Here",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(126, 32, 32, 32))),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                child: Text("Reset Password"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 72, 0),
                    fixedSize: Size(150, 50)),
                onPressed: () async {
                  try {
                    sendPasswordResetEmail();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Password reset"),
                            content: Text(
                                "A password reset email has been sent to your email address."),
                            actions: <Widget>[
                              TextButton(
                                child: Text("Ok"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        });
                  } catch (e) {
                    setState(() {
                      errorMessage;
                    });
                  }
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              errorMessage!,
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
