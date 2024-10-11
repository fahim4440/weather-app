import 'package:geolocator/geolocator.dart';

class Repositories {

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return await Geolocator.getCurrentPosition();
  }

  String getImageName(int imageCode) {
    switch (imageCode) {
      case >= 200 && < 300 :
        return 'assets/1.png';
      case >= 300 && < 400 :
        return 'assets/2.png';
      case >= 500 && < 600 :
        return 'assets/3.png';
      case >= 600 && < 700 :
        return 'assets/4.png';
      case >= 700 && < 800 :
        return 'assets/5.png';
      case == 800 :
        return 'assets/6.png';
      case > 800 && <= 804 :
        return 'assets/7.png';
      default:
        return 'assets/7.png';
    }
  }
}