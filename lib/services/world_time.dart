import 'package:http/http.dart';
import 'dart:convert';

class WorldTime{

  String? location; //location name for ui
  String? time; //time in the location
  String? flag; //url to an asset flag icon
  String? url;
  // String? time; //location api endpoint

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    // print(datetime);
    // print(offset);


    //create DateTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    //set the time property
    time = now.toString();
  }

}
