import 'package:autoservicingnepal/Appoinment_page/AppointmentViewPage.dart';
import 'package:autoservicingnepal/ComingSoon.dart';
import 'package:autoservicingnepal/Homepage/ProfilePage.dart';

import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MaterialButton(
              minWidth: 10,
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AppointmentViewPage()));
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 25,
                    width: 30,
                    child: Image.asset('appointment.png'),
                  ),
                  Text(
                    "Appointment",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 10,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ComingSoonPage()));
              },
              child: Column(
                children: [
                  SizedBox(height: 10, width: 20),
                  Container(
                    // alignment: Alignment.center,
                    height: 25,
                    width: 30,
                    child: Image.asset('offer.png'),
                  ),
                  Text(
                    "Offers",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 40,
            ),
            MaterialButton(
              minWidth: 10,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ComingSoonPage()));
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 25,
                    width: 30,
                    child: Image.asset('customer-service.png'),
                  ),
                  Text(
                    "Support",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 25,
                    width: 30,
                    child: Image.asset('profile-user.png'),
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(fontSize: 10),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
