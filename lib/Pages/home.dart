import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map ;

    // print(data.runtimeType);
    print(data['location']);
    // Access the passed arguments
    // DateTime time = args.time;
    // String location = args!.location;
    // bool flag = args.flag;

    // Store the arguments in the data variable
    // Map<String, dynamic> data = {
    //   'time': args.time,
    //   'location': args.location,
    //   'flag': args.flag,
    // };


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/locations');
              },
              icon: Icon(Icons.edit_location),
              label: Text('Edit Location'),
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Text(
                  data['location'],
                ),
              ],
            ),
          ],

        ),
      ),
    );
  }
}
