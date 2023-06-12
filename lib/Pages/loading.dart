import 'package:flutter/material.dart';
import 'package:time_app/services/world_time.dart';

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
    print(instence.time);
    setState(() {
      time = instence.time ??'value';
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
      body: Padding(
        padding: EdgeInsets.all(50.0),
          child: Text(time),
      ),
    );
  }
}
