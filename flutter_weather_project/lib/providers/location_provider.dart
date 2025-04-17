import 'package:flutter/material.dart';
import 'package:flutter_weather_project/models/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocationProvider extends ChangeNotifier {
  ///Holds list of all locations added by user
  List<Location> _locations = [];
  List<Location> get locations => _locations;

  ///Holds currently selected location
  Location? _selectedLocation;
  Location? get selectedLocation => _selectedLocation;

  ///Determines if provider is busy
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //Field that holds error messages
  String? _error;
  String? get error => _error;

  void fetchLocations() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Load saved locations list
      final List<String>? encodedList = prefs.getStringList('locations');
      if (encodedList == null) {
        _locations = [];
      } else {
        _locations =
            encodedList
                .map((jsonStr) => Location.fromJson(json.decode(jsonStr)))
                .toList();
      }

      // Load selected location (if any)
      final String? encodedLocation = prefs.getString('selectedLocation');
      if (encodedLocation == null) {
        _selectedLocation = null;
      } else {
        _selectedLocation = Location.fromJson(json.decode(encodedLocation));
      }
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  void addLocation(Location location) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      _locations.add(location);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final List<String>? decodedList = prefs.getStringList('locations');
      if (decodedList == null) return;
      final List<Location> locationsList =
          decodedList
              .map((jsonStr) => Location.fromJson(json.decode(jsonStr)))
              .toList();
      locationsList.add(location);
      final List<String> encodedList =
          locationsList
              .map((location) => json.encode(location.toJson()))
              .toList();
      await prefs.setStringList('locations', encodedList);
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
