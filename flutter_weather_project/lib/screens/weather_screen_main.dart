import 'package:flutter/material.dart';
import 'package:flutter_weather_project/providers/weather_provider.dart';
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
    final weatherProvider = Provider.of<WeatherProvider>(
      context,
      listen: false,
    );
    weatherProvider.fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(
      context,
      listen: false,
    );

    if (weatherProvider.locations.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'SELECT LOCATION',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );
    } else if (weatherProvider.locations.isNotEmpty &&
        weatherProvider.selectedLocation == null) {
      //Return screen to pick selected location
      return SizedBox();
    } else {
      //Return screen with selected location from provider
      return SizedBox();
    }
  }
}
