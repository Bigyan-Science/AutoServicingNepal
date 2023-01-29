import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class IndividualPage extends StatelessWidget {
  IndividualPage({
    super.key,

    // required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return ListView.builder(
                itemBuilder: (context, index) {
                  return DisplayAppointment(
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
    );
  }
}

class DisplayAppointment extends StatefulWidget {
  const DisplayAppointment({super.key, required this.snap});
  final snap;

  @override
  State<DisplayAppointment> createState() => _DisplayAppointmentState();
}

class _DisplayAppointmentState extends State<DisplayAppointment> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3000,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.teal,
            Colors.blue,
            Colors.teal,
          ],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(30),
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 254, 182, 73),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: Text('${widget.snap['Brand Name']}'),
                ),
                
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(18, 0, 10, 10),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const VerticalDivider(
                        color: Colors.black, //color of divider
                        width: 10, //width space of divider
                        thickness: 3, //thickness of divier line
                        indent: 5, //Spacing at the top of divider.
                        endIndent: 13, //Spacing at the bottom of divider.
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: SizedBox(
                          width: 250,
                          child: Text(
                            '${widget.snap['SelectedTimeSlots']}',
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //ingredients

                //step
              ]),
        ),
      ),
    );
  }
}
