import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GeoService {
  
  Future<Position> takeGeolocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      throw Exception("GPS desativado");
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition(
      // ignore: deprecated_member_use
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
  }

  // ignore: non_constant_identifier_names
  Future<Map<String, String?>> TakeAdress(double lat, double lng) async {
  try {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);

    final place = placemarks.first;

    return {
      "endereco": "${place.street}, ${place.subLocality}",
      "cep": place.postalCode
    };
  } catch (_) {
    return {
      "endereco": null,
      "cep": null
    };
  }
}
}
