// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_911/classes/getdata.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<AllCountries> allCountries = [
    AllCountries(
        link: 'Africa/Cairo', countryName: 'Egypt - Cairo', flag: 'egypt.png'),
    AllCountries(
        link: 'Africa/Tunis',
        countryName: 'Tunisia - Tunis',
        flag: 'tunisia.png'),
    AllCountries(
        link: 'Africa/Algiers',
        countryName: 'Algeria - Algiers',
        flag: 'algeria.png'),
    AllCountries(
        link: 'Australia/Sydney',
        countryName: 'Australia - Sydney',
        flag: 'australia.png'),
    AllCountries(
        link: 'America/Toronto',
        countryName: 'Canada - Toronto',
        flag: 'canada.png'),
    AllCountries(
        link: 'Asia/Riyadh',
        countryName: '	Saudi Arabia - Riyadh',
        flag: 'sa.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: const Color.fromARGB(146, 12, 16, 49),
        title: Text(
          "Choose location",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 191, 191, 199),
      body: SizedBox(
        // height: ,
        child: ListView.builder(
          padding: EdgeInsets.all(7),
          itemCount: allCountries.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () async {
                  AllCountries clickedCountry = allCountries[index];
                  await clickedCountry.getData();
                  Navigator.pop(context, {
                    "time": clickedCountry.timeNow,
                    "location": clickedCountry.link,
                    "isDayTime": clickedCountry.isDayTime
                  });
                },
                title: Text(
                  allCountries[index].countryName,
                  style: TextStyle(fontSize: 20),
                ),
                leading: CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage("assets/${allCountries[index].flag}"),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
