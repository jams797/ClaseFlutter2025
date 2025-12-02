// To parse this JSON data, do
//
//     final favouritePlaceModelPreference = favouritePlaceModelPreferenceFromJson(jsonString);

import 'dart:convert';

List<String> favouritePlaceModelPreferenceFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String favouritePlaceModelPreferenceToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
