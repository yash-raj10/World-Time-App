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

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map ;

    print(data);

    // set background
    String  bgImage = (data?['isDayTime'] ?? true) ? 'day.jpg' : 'night.jpg' ;

    return Scaffold(
      backgroundColor: Colors.white38,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image : DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data?['location'] as String ?? 'okie',
                      style: TextStyle(
                        fontSize: 35.0,
                        letterSpacing: 3.0,
                        color: Colors.grey[600],

                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 70.0,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 20.0),
                TextButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/locations');
                    setState(() {
                      data = {
                        'time': result['result'],
                        'location': result['location'],
                        'isDaytime': result['result'],
                        'flag': result['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.black,
                  ),
                  label: Text(
                      'Change Location',
                    style: TextStyle(
                      color: Colors.indigoAccent,
                    ),
                  ),
                ),


              ],

            ),
          ),
        ),
      ),
    );
  }
}
