import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper{
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      String data = response.body;
      var decode = jsonDecode(data);
      var temp = decode['main']['temp'];
      var condition = decode['weather'][0]['id'];
      var city = decode['name'];
      print('$temp $condition $city');
      return decode;
    }else{
      print(response.statusCode);
    }
  }

}