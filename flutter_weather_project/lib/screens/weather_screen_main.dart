import 'package:flutter/material.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:provider/provider.dart';

class WeatherScreenMain extends StatefulWidget {
  const WeatherScreenMain({super.key});

  @override
  State<WeatherScreenMain> createState() => _WeatherScreenMainState();
}

class _WeatherScreenMainState extends State<WeatherScreenMain> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  void _getData() {
    final locationProvider = Provider.of<LocationProvider>(
      context,
      listen: false,
    );
    locationProvider.fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    if (locationProvider.isLoading) {
      return SizedBox();
    } else {
      if (locationProvider.locations.isEmpty) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'SELECT LOCATION',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        );
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
