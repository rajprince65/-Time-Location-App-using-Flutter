import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "loading....";
  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        flag: 'kathmandu.png', location: 'Kathmandu', url: 'Asia/Kathmandu');
    await instance.getTime();
    // print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        child: Text(
          "$time",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
