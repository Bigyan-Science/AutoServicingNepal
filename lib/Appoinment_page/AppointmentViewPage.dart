import 'package:autoservicingnepal/Appoinment_page/Appointment.dart';
import 'package:autoservicingnepal/Appoinment_page/AppointmentNull.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppointmentViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: FutureBuilder(builder: (context, snap) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Appointment')
                .where('UserId',
                    isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data!.docs.length == 0) {
                return AppointmentNull();
              }
              if (!snapshot.hasData) return CircularProgressIndicator();
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return Appointment(snap: snapshot.data!.docs[index]);
                },
              );
            },
          ),
        );
      }),
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

// StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('Appointment')
//             .where('UserId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return CircularProgressIndicator();
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               return Appointment(snap: snapshot.data!.docs[index]);
//             },
//           );
//         },
//       ),
  }
}
