import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
    // print("flag:${instance.flag}");
    // print("location:${instance.location}");
    // print("time:${instance.time}");
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': instance.flag,
      'location': instance.location,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size: 50.0,
          ),
        ),
      );
}
