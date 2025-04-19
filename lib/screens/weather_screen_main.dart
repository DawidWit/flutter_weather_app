import 'package:flutter/material.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:flutter_weather_project/screens/loading_screen.dart';
import 'package:flutter_weather_project/screens/no_locations_screen/no_locations_screen.dart';
import 'package:provider/provider.dart';

class WeatherScreenMain extends StatefulWidget {
  const WeatherScreenMain({super.key});

  @override
  State<WeatherScreenMain> createState() => _WeatherScreenMainState();
}

class _WeatherScreenMainState extends State<WeatherScreenMain> {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    if (locationProvider.isLoading) {
      return LoadingScreen();
    } else {
      if (locationProvider.locations.isEmpty) {
        return NoLocationsScreen();
      } else if (locationProvider.locations.isNotEmpty &&
          locationProvider.selectedLocation == null) {
        //Return screen to pick selected location
        return SizedBox();
      } else {
        //Return screen with selected location from provider
        return SizedBox();
      }
    }
  }
}
