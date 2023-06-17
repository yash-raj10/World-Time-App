import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

  void setupWorldTime() async{
    WorldTime instence = WorldTime(location: 'Berlin', flag: 'india.png', url: 'Europe/Berlin',);
    await instence.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments:{
      'location': instence.location,
      'flag': instence.flag,
      'time': instence.time,
      'isDayTime' : instence.isDayTime,
    });
  }

  @override
  void initState(){
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38,
      body: Center(
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Text('Made with ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.bold,
              )),
          SpinKitPumpingHeart(
          color: Colors.red,
          size: 50.0,
           ),

        ],
      ),

      ),
    );
  }
}