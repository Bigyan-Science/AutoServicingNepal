import 'package:autoservicingnepal/Map/MapPage.dart';
import 'package:flutter/material.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: SizedBox(
        height: 50,
        width: 50,

        // color: Color.fromARGB(255, 255, 255, 255),
        child: Image.asset(
          'assets/location-pin.png',
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => WorkshopNearbyPage()));
      },
    );
  }
}
