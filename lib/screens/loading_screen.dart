import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';

import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat = 0.0;
  double lon = 0.0;

  Future<void> getLocationData() async {
    try {
      var weatherData = await WeatherModel().getLocationWeather();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(weatherData);
      }));
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
