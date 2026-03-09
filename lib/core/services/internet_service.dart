import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {
  Future<bool> temInternet() async {
    final result = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    return result != ConnectivityResult.none;
  }
}
