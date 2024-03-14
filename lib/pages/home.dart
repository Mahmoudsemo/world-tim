// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    String bgimg = data["isDayTime"] ? "day.png" : "night.png";
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 55, 53, 63),
            image: DecorationImage(
                image: AssetImage("assets/$bgimg"), fit: BoxFit.cover)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  print(result);
                  setState(() {
                    if (result == null) {
                      data = {
                        "time": "Choose location",
                        "location": " Choose location",
                        "isDayTime": false
                      };
                    } else {
                      data = {
                        "time": result["time"],
                        "location": result["location"],
                        "isDayTime": result["isDayTime"]
                      };
                    }
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  size: 25,
                  color: Colors.red,
                ),
                label: Text(
                  "Edit location",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(118, 33, 89, 243)),
                    padding: MaterialStateProperty.all(EdgeInsets.only(
                        right: 30, left: 30, top: 15, bottom: 15)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
              ),
              SizedBox(
                height: 300,
              ),
              Container(
                width: double.infinity,
                height: 200,
                color: Color.fromARGB(113, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      data["time"],
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                    Text(
                      data["location"],
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
