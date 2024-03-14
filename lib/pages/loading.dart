// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_911/classes/getdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  getDataLoadingPage() async {
    AllCountries oneCountry =
        AllCountries(link: "Africa/Cairo", countryName: "Egypt", flag: "egypt");
    await oneCountry.getData();
    Navigator.restorablePushNamed(context, "/home", arguments: {
      "time": oneCountry.timeNow,
      "location": oneCountry.timeZone,
      "isDayTime": oneCountry.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    getDataLoadingPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitFadingCircle(
              color: Colors.white54,
              size: 110,
            ),
          ],
        ),
      ),
    );
  }
}
