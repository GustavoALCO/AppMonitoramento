import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

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
        //Busca endereço e Numero
        "endereco": "${place.street}, ${place.subThoroughfare}",
        "cidade": place.administrativeArea,
      };
    } catch (_) {
      return {"endereco": "Erro ao buscar endereço", "cidade": "Cidade não encontrada"};
    }
  }

  Future<void> openMap(double lat, double lng) async {
  final Uri url = Uri.parse(
    "https://www.google.com/maps/@?api=1&map_action=pano&viewpoint=$lat,$lng",
  );

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    throw Exception('Não foi possível abrir o mapa');
  }
}
}
