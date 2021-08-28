import 'dart:convert';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat = 0.0;
  double lon = 0.0;

  Future<void> getLocationData() async {
    try {
      Location location = new Location();
      await location.getCurrentLocation();
      lat = location.lat;
      lon = location.lon;
      String url =
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$KApiKey';
      NetworkHelper networkHelper = new NetworkHelper(url);
      var weatherData = networkHelper.getData();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return LocationScreen();
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
    return Scaffold();
  }
}
