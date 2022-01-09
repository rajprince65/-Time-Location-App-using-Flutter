import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    String data1 = await Future.delayed(Duration(seconds: 2), () {
      return "yashi";
    });
    String data2 = await Future.delayed(Duration(seconds: 2), () {
      return "vegiterian,tekwandoo,student";
    });
    print("$data1 - bio $data2");
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("study async in get data");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        title: Text('Choose a location'),
        backgroundColor: Colors.blue[700],
        elevation: 0.0,
      ),
    );
  }
}
