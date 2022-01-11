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
      String timezone = timedata['timezone'];
      int week_no = timedata['day_of_week'];
      int day_of_year = timedata['day_of_year'];

      // print("..............................................");

      print(datetime);
      print(timezone);
      print(week_no);
      print(day_of_year);
      // print(timedata);
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
