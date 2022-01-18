
import 'package:flutter/material.dart';
import 'package:simple_weather_determine_app/screens/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AllWeather());
  }
}

class AllWeather extends StatefulWidget {
  const AllWeather({Key? key}) : super(key: key);

  @override
  _AllWeatherState createState() => _AllWeatherState();
}

class _AllWeatherState extends State<AllWeather> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage()
    );
  }
}
