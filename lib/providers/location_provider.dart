import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_weather_project/models/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider extends ChangeNotifier {
  List<Location> _locations = [];
  List<Location> get locations => _locations;

  Location? _selectedLocation;
  Location? get selectedLocation => _selectedLocation;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  SharedPreferences? _prefs;

  /// Constructor: call `_init()` to load SharedPreferences and fetch data
  LocationProvider() {
    _init();
  }

  /// Initialization logic
  Future<void> _init() async {
    _isLoading = true;
    notifyListeners();

    try {
      _prefs = await SharedPreferences.getInstance();
      final List<Location>? temp = await _fetchLocationsFromPreferences();
      _locations = temp ?? [];
      _selectedLocation = await _fetchSelectedLocationFromPreferences();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<List<Location>?> _fetchLocationsFromPreferences() async {
    final List<String>? decodedList = _prefs?.getStringList('locations');
    if (decodedList == null) return null;
    return decodedList
        .map((jsonStr) => Location.fromJson(json.decode(jsonStr)))
        .toList();
  }

  Future<Location?> _fetchSelectedLocationFromPreferences() async {
    final String? encodedLocation = _prefs?.getString('selectedLocation');
    if (encodedLocation == null) return null;
    return Location.fromJson(json.decode(encodedLocation));
  }

  Future<bool> addLocation(Location location) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _locations.add(location);
      final List<Location> temp = await _fetchLocationsFromPreferences() ?? [];
      temp.add(location);
      final List<String> encodedList =
          temp.map((loc) => json.encode(loc.toJson())).toList();
      await _prefs?.setStringList('locations', encodedList);
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    }
  }
}
