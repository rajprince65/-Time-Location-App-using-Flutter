import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    // home: Home(),
    initialRoute: "/home",
    routes: {
      '/': (context) => Loading(), //default
      '/home': (context) => Home(),
      '/location': (conext) => ChooseLocation(),
    },
  ));
}
