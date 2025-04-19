import 'package:flutter/material.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:flutter_weather_project/screens/loading_screen.dart';
import 'package:flutter_weather_project/screens/locations_screen/locations_screen.dart';
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
    } else if (locationProvider.selectedLocation == null) {
      return LocationsScreen();
    } else {
      return Container(color: Colors.pink, child: Text('test'));
    }
  }
}
