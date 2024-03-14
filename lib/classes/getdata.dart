// ignore_for_file: unused_local_variable, camel_case_types

import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class AllCountries {
  final String countryName;
  final String flag;
  final String link;

  // AllCountries(
  //       link: 'Africa/Algiers',
  //       countryName: 'Algeria - Algiers',
  //       flag: 'algeria.png'),

  AllCountries(
      {required this.countryName, required this.flag, required this.link});
  late String timeNow;
  late String timeZone;
  late bool isDayTime;
  getData() async {
    Response recevedData =
        await get(Uri.parse("http://worldtimeapi.org/api/timezone/$link"));
    Map data = jsonDecode(recevedData.body);
    DateTime dateTime = DateTime.parse(data["utc_datetime"]);
    int offset = int.parse(data["utc_offset"].substring(0, 3));
    DateTime realTime = dateTime.add(Duration(hours: offset));
    if (realTime.hour > 5 && realTime.hour < 18) {
      isDayTime = true;
    } else {
      isDayTime = false;
    }

    timeNow = DateFormat("hh:mm a").format(realTime);
    timeZone = data["timezone"];
  }
}
