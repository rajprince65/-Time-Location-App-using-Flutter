import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    try {
      Response response =
          await get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
      Map jsondata = jsonDecode(response.body) as Map;
      print(jsondata);
      print(jsondata['id']);
      print(jsondata['userId']);
      print(jsondata['title']);
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
