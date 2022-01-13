import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String flag; //use ? instead of using String flag=''
  String location;
  String url;
  String time = '';

  WorldTime(
      {required String this.flag,
      required String this.location,
      required String this.url});

  Future<void> getTime() async {
    try {
      //make request
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));

      Map timedata = jsonDecode(response.body);
      print(timedata);

      //get properties from data

      String datetime = timedata['datetime'];
      //String offset = timedata['utc_offset'];
      String houroffset = timedata['utc_offset'].substring(1, 3);
      String minuteoffset = timedata['utc_offset'].substring(4, 6);

      print("Hour $houroffset");
      print("Minute $minuteoffset");

      //create datetime obj
      DateTime datetimeobj = DateTime.parse(datetime);
      datetimeobj = datetimeobj.add(Duration(
          hours: int.parse(houroffset), minutes: int.parse(minuteoffset)));
      print(datetimeobj);
      time = datetimeobj.toString();
    } on Exception catch (e) {
      print(e);
    }
  }
}
