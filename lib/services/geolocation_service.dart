import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_weather_project/models/location.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uuid/uuid.dart';

class GeolocationService {
  static Future<List<Location>?> getLocationSearchResult(
    String searchText,
  ) async {
    final res = await http.get(
      Uri.parse(
        'https://api.geoapify.com/v1/geocode/autocomplete?text=$searchText&type=city&format=json&apiKey=${dotenv.env['GEOAPIFY_API_KEY']}',
      ),
    );
    if (res.statusCode == 200) {
      List<Location> locations = [];
      final data = json.decode(res.body);
      try {
        data['results'].sort(
          (a, b) => b['rank']['importance'].toString().compareTo(
            a['rank']['importance'].toString(),
          ),
        );
        for (final location in data['results']) {
          if (location['result_type'] != "city" &&
              location['result_type'] != 'postcode') {
            continue;
          }
          Location loc = Location(
            id: Uuid().v4(),
            fullLocationName: location['formatted'] ?? '',
            locationName: location['city'] ?? '',
            sublocationName: location['state'] ?? '',
            countryCode: location['country_code'],
            latitude: location['lat'],
            longitude: location['lon'],
          );
          locations.add(loc);
        }
        return locations;
      } catch (e) {
        if (kDebugMode) print(e);
        return null;
      }
    }
    return null;
  }
}
