import 'package:connectivity_plus/connectivity_plus.dart';

class InternetService {

  Future<bool> temInternet() async {

    final List<ConnectivityResult> result =
        await Connectivity().checkConnectivity();

    return !result.contains(ConnectivityResult.none);
  }
}