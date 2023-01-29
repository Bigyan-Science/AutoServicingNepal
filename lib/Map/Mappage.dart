import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';

import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:flutter/material.dart';

class WorkshopNearbyPage extends StatefulWidget {
  const WorkshopNearbyPage({super.key});

  @override
  _WorkshopNearbyPageState createState() => _WorkshopNearbyPageState();
}

class _WorkshopNearbyPageState extends State<WorkshopNearbyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: ListView(children: [
        const SearchBar(),
        Container(
          height: 610,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 255, 251, 243),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Workshops Nearby',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                // padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                height: 280,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: const DecorationImage(
                      image: AssetImage(
                        'workshopMap.png',
                      ),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.all(10),
                  color: Colors.white,
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'bikeLogo.png',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'PS Workshop',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 72, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Yamaha Bike Workshop',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                'Maitidevi, Ratopul',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'MTbike.png',
                          height: 90,
                          width: 90,
                        )
                      ]),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.all(10),
                  color: Colors.white,
                  height: 100,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'carLogo.png',
                            height: 50,
                            width: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'PS Workshop',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 72, 0),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Hyundai Car Workshop',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              Text(
                                'Maitidevi, Ratopul',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          'hondacar.png',
                          height: 90,
                          width: 90,
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ]),
      bottomNavigationBar: CustomBottomBar(),
      floatingActionButton: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
