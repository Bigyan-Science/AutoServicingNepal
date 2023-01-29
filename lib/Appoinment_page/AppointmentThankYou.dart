import 'package:autoservicingnepal/Appoinment_page/AppointmentViewPage.dart';
import 'package:autoservicingnepal/Appoinment_page/Appointment.dart';
import 'package:autoservicingnepal/Appoinment_page/AppointmentNull.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentThanksPage extends StatefulWidget {
  const AppointmentThanksPage({super.key});

  @override
  _AppointmentThanksPageState createState() => _AppointmentThanksPageState();
}

class _AppointmentThanksPageState extends State<AppointmentThanksPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: StreamBuilder(
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Thanks(
                    snap: snapshot.data!.docs[index].data(),
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
          }
          return CircularProgressIndicator();
        },
        stream:
            FirebaseFirestore.instance.collection("Appointment").snapshots(),
      ),
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class Thanks extends StatefulWidget {
  const Thanks({super.key, required this.snap});
  final snap;

  @override
  State<Thanks> createState() => _ThanksState();
}

class _ThanksState extends State<Thanks> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SearchBar(),
      Container(
        height: 500,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 255, 251, 243),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              height: 350,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    child: Image.asset(
                      'thanksImage.png',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                    width: 250,
                  ),
                  Text(
                    "Thanks ${widget.snap['Name']}for booking.",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "You booked an appointment for ${widget.snap['Brand Name']}  at ${widget.snap['SelectedDate']} and ${widget.snap['SelectedTimeSlots']} ",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              // color: Colors.pink,

              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 72, 0)
                      // side: BorderSide(color: Colors.black, width: 1)
                      ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AppointmentViewPage()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: 300,
                    child: Text(
                      'Go to My Appointments',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )),
            ),
          ],
        ),
      ),
    ]);
  }
}
