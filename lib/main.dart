import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Home(),
    //initialRoute: "/",
    routes: {
      '/': (context) => Loading(), //default
      '/home': (context) => Home(),
      '/location': (conext) => ChooseLocation(),
    },
  ));
}
