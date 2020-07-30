import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_report/ui/CityWeather.dart';
import 'package:weather_report/ui/Home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.tealAccent, // status bar color
  ));
  runApp(MaterialApp(
      title: 'Weather Report',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primarySwatch: Colors.teal),
      home: new SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/Home': (BuildContext context) => Home(),
      }));
}


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  Future navigationPage() async {
      Navigator.of(context).pushReplacementNamed('/Home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.teal,
        child: Center(
          child:Text(
            "Splash",
            style: TextStyle(
                color: Colors.white,
                fontWeight:
                FontWeight.w500,
                fontSize: 13.0),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}