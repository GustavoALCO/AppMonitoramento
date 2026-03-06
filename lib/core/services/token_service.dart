import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class TokenService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> createToken(String jwt) async {
    await _storage.write(key: "jwt", value: jwt);
  }

  Future<int?> getIdPayload() async {
    final token = await _storage.read(key: "jwt");

    if (token == null) return null;

    final decodedToken = JwtDecoder.decode(token);

    return int.parse(decodedToken["sub"]);
  }

  Future<String?> getNameFiscal() async {
    final token = await _storage.read(key: "jwt");

    if (token == null) return null;

    final decodedToken = JwtDecoder.decode(token);

    return decodedToken["unique_name"];
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: "jwt");
  }

  Future<bool> verifyJWT() async {
    final token = await _storage.read(key: "jwt");

    if (token == null) return false;

    return !JwtDecoder.isExpired(token);
  }
}
