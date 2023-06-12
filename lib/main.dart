import 'package:flutter/material.dart';
import 'package:time_app/Pages/home.dart';
import 'package:time_app/Pages/loading.dart';
import 'package:time_app/Pages/locations.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/locations': (context) => ChooseLocation(),

  } ,
));

