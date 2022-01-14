import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
    String resultDay = data['isDayTime'] ? "day.png" : "night.png";
    Color bgcolor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
        backgroundColor: bgcolor,
        body: SafeArea(
            child: Center(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/$resultDay"),
              fit: BoxFit.cover,
            )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 100, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'flag': result['flage'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                        };
                      });
                    },
                    icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                    label: const Text(
                      "Edit Location",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        //data.isEmpty ? "location" : data['location'],
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    data['time'],
                    //  data.isEmpty ? "time" : data['time'],
                    style: const TextStyle(
                      fontSize: 60,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )));
  }
}
