import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    try {
      //make request
      Response response = await get(
          Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Kathmandu'));
      Map timedata = jsonDecode(response.body) as Map;

      //get properties from data

      String datetime = timedata['datetime'];
      String offset = timedata['utc_offset'];
      String houroffset = timedata['utc_offset'].substring(1, 3);
      String minuteoffset = timedata['utc_offset'].substring(4, 6);

      // print("Hour $houroffset");
      //print("Minute $minuteoffset");

      DateTime datetimeobj = DateTime.parse(datetime);
      datetimeobj = datetimeobj.add(Duration(
          hours: int.parse(houroffset), minutes: int.parse(minuteoffset)));

      print("datetimeobj..$datetimeobj");
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
