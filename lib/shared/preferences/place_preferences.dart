// import 'package:app_prueba/main.dart';
import 'package:app_prueba/shared/models/favourite_place_model_preference.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class PlacePreferences {

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  late final FlutterSecureStorage storage;

  final String _keyPlaceSearch = 'place';
  final String _keyPlacesFavourite = 'placesFavourite';

  PlacePreferences() {
    storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
    //storage = FlutterSecureStorage();
  }

  Future<String> getPlaceSearch() async {
    return await storage.read(key: _keyPlaceSearch) ?? '';
  }

  Future<void> setPlaceSearch(String place) async {
    return await storage.write(key: _keyPlaceSearch, value: place);
  }

  Future<List<String>> getPlacesFavourite() async {
    String? placesF = await storage.read(key: _keyPlacesFavourite);
    if(placesF == null) {
      return [];
    } else {
      return favouritePlaceModelPreferenceFromJson(placesF);
    }
  }

  Future<void> addPlacesFavourite(String codPlace) async {
    List<String> placesF = await getPlacesFavourite();
    if(!placesF.contains(codPlace)) {
      placesF.add(codPlace);
      return await storage.write(key: _keyPlacesFavourite, value: favouritePlaceModelPreferenceToJson(placesF));
    }
  }

  Future<void> delPlacesFavourite(String codPlace) async {
    List<String> placesF = await getPlacesFavourite();
    placesF.remove(codPlace);
    return await storage.write(key: _keyPlacesFavourite, value: favouritePlaceModelPreferenceToJson(placesF));
  }
}