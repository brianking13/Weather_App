import 'package:flutter/material.dart';
import 'package:weatherapp/pages/choose_location.dart';
import 'package:weatherapp/pages/home.dart';
import 'package:weatherapp/pages/loading.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(accentColor: Colors.blueGrey[900]),
  initialRoute: '/',
  routes:{
    '/': (context) =>Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));

