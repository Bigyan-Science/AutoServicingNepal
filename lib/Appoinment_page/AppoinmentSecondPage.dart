import 'package:autoservicingnepal/Appoinment_page/AppoinmentDateTime.dart';
import 'package:autoservicingnepal/ReusableWidget/FloatingActionButton.dart';
import 'package:autoservicingnepal/ReusableWidget/SearchBar.dart';
import 'package:autoservicingnepal/ReusableWidget/appBar.dart';
import 'package:autoservicingnepal/ReusableWidget/bottomNavigationBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppointmentSecondPage extends StatefulWidget {
  AppointmentSecondPage(
      {super.key, required this.brand, required this.productId});
  String? brand;
  String? productId;

  @override
  _AppointmentSecondPageState createState() => _AppointmentSecondPageState();
}

class _AppointmentSecondPageState extends State<AppointmentSecondPage> {
  final List<String> serviceType = [
    "Normal Problem",
    "Washing",
    "Servicing",
    "Checkup",
    "Parts",
    "Modify"
  ];
  String? selectedServiceType;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: ListView(children: [
        const SearchBar(),
        Container(
          height: 650,
          width: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 255, 251, 243),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Book Appointment",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "How We May Help:",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                    height: 200,
                    child: Wrap(
                      spacing: 8.0, // space between the children
                      runSpacing: 8.0, // space between the lines
                      children: List.generate(serviceType.length, (index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedServiceType = serviceType[index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              alignment: Alignment.center,
                              height: 80,
                              width: 120,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color:
                                      selectedServiceType == serviceType[index]
                                          ? Color.fromARGB(255, 255, 72, 0)
                                          : Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: selectedServiceType ==
                                              serviceType[index]
                                          ? Color.fromARGB(255, 255, 72, 0)
                                          : Color.fromARGB(44, 0, 0, 0))),
                              child: Text(
                                serviceType[index],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                  color:
                                      selectedServiceType == serviceType[index]
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )),
              ),
              SizedBox(
                // color: Colors.pink,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 251, 243),
                            side: BorderSide(
                              color: Color.fromARGB(50, 0, 0, 0),
                            )),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          // color: Colors.white,
                          // alignment: Alignment.topLeft,
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          decoration: BoxDecoration(
                            // color: Color.fromARGB(38, 255, 100, 4),
                            // color: Color.fromARGB(255, 255, 251, 243),
                            // color: Color.fromARGB(19, 6, 13, 217),
                            borderRadius: BorderRadius.circular(10),
                          ),

                          child: Text(
                            'Back',
                            style: TextStyle(color: Colors.black),
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 255, 72, 0)
                            // side: BorderSide(color: Colors.black, width: 1)
                            ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AppointmentDateTimePage(
                                    productId: widget.productId,
                                    brand: widget.brand,
                                    selectedServiceType: selectedServiceType,
                                  )));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 120,
                          child: Text(
                            'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
      // bottomNavigationBar: CustomFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
