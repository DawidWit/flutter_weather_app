import 'package:flutter/material.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:flutter_weather_project/screens/locations_screen/new_location.dart';
import 'package:flutter_weather_project/screens/locations_screen/location_tile.dart';
import 'package:flutter_weather_project/screens/locations_screen/no_locations_info.dart';
import 'package:provider/provider.dart';

class LocationsScreen extends StatelessWidget {
  const LocationsScreen({super.key});

  void _showAddForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewLocationForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title: Text(
          'SELECT LOCATION',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () => _showAddForm(context),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body:
          locationProvider.locations.isEmpty
              ? NoLocationsInfo()
              : Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: locationProvider.locations.length,
                  itemBuilder:
                      (context, index) => LocationTile(
                        location: locationProvider.locations[index],
                        isFromForm: false,
                      ),
                ),
              ),
    );
  }
}
