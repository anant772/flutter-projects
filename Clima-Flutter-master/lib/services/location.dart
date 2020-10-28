import 'package:geolocator/geolocator.dart';


class Location {
  double latitude, longitude;
  Future<void> getLocation() async {
    try {
      Position position =
          await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
