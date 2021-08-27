import 'package:geolocator/geolocator.dart';

class Location {
  double _lat = 0.0;
  double _lon = 0.0;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      _lat = position.latitude;
      _lon = position.longitude;
      print(position);
    } catch (e) {
      print(e);
    }
  }

  double get lon => _lon;

  double get lat => _lat;
}
