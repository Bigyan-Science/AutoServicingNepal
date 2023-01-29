import 'package:autoservicingnepal/Homepage/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 70,
      backgroundColor: Colors.white,
      leading: MaterialButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
          },
          child: Image.asset("homepage.png")),
      title: Padding(
        padding: const EdgeInsets.only(left: 100),
        child: Container(
            height: 100,
            width: 80,
            alignment: Alignment.center,

            // padding: const EdgeInsets.only(right: 60),
            child: Image.asset('assets/logo.png')),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
// ignore: non_constant_identifier_names

