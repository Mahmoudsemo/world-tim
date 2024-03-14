// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_911/pages/home.dart';
import 'package:flutter_application_911/pages/loading.dart';
import 'package:flutter_application_911/pages/location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      initialRoute: '/loading',
      routes: {
        '/loading': (context) => const Loading(),
        '/home': (context) => const Home(),
        '/location': (context) => const Location(),
      },
    );
  }
}
