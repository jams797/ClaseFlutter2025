// import 'package:app_prueba/main.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PlacePreferences {

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  late final FlutterSecureStorage storage;

  final String _keyPlaceSearch = 'place';

  PlacePreferences() {
    // storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    storage = FlutterSecureStorage();
  }

  Future<String> getPlaceSearch() async {
    return await storage.read(key: _keyPlaceSearch) ?? '';
  }

  Future<void> setPlaceSearch(String place) async {
    return await storage.write(key: _keyPlaceSearch, value: place);
  }
}