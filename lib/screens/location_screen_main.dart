import 'package:flutter/material.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:flutter_weather_project/screens/loading_screen.dart';
import 'package:flutter_weather_project/screens/locations_screen/locations_screen.dart';
import 'package:flutter_weather_project/screens/weather_screen_main.dart';
import 'package:provider/provider.dart';

class LocationScreenMain extends StatefulWidget {
  const LocationScreenMain({super.key});

  @override
  State<LocationScreenMain> createState() => _LocationScreenMainState();
}

class _LocationScreenMainState extends State<LocationScreenMain> {
  bool _hasNavigated = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locationProvider = Provider.of<LocationProvider>(context);

    if (!_hasNavigated &&
        !locationProvider.isLoading &&
        locationProvider.selectedLocation != null) {
      _hasNavigated = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => WeatherScreenMain()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    if (locationProvider.isLoading) {
      return const LoadingScreen();
    } else if (locationProvider.selectedLocation == null) {
      return const LocationsScreen();
    } else {
      return const LoadingScreen();
    }
  }
}
