import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentCard extends StatelessWidget {
  final DocumentSnapshot snap;

  AppointmentCard({required this.snap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: ListTile(
        leading: Text("Brand Name: " + (snap.get("Brand Name") ?? "N/A")),
        title: Text("Date: " + (snap.get("SelectedDate") ?? "N/A")),
        subtitle: Text("Time: " + (snap.get("SelectedTimeSlots") ?? "N/A")),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
