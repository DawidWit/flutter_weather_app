import 'package:flutter/material.dart';
import 'package:flutter_weather_project/models/location.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  final bool isFromForm;
  const LocationTile({
    super.key,
    required this.location,
    required this.isFromForm,
  });

  void _onPressFunction(BuildContext context) async {
    if (isFromForm) {
      final locationProvider = Provider.of<LocationProvider>(
        context,
        listen: false,
      );
      await locationProvider.addLocation(location);
      if (!context.mounted) return;
      Navigator.pop(context);
    } else {}
  }

  void _onSwipeFunction(BuildContext context) async {
    final locationProvider = Provider.of<LocationProvider>(
      context,
      listen: false,
    );
    bool res = await locationProvider.removeLocation(location);
    if (!context.mounted) return;
    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Location removed successfully'),
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget tileContent = Card(
      color: Theme.of(context).cardColor,
      elevation: 2.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CountryFlag.fromCountryCode(
              location.countryCode,
              shape: const Circle(),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextScroll(
                    location.locationName,
                    velocity: const Velocity(pixelsPerSecond: Offset(17, 0)),
                    style:
                        location.sublocationName.isNotEmpty
                            ? Theme.of(context).textTheme.headlineSmall
                            : Theme.of(context).textTheme.headlineMedium,
                  ),
                  if (location.sublocationName.isNotEmpty)
                    Text(location.sublocationName),
                ],
              ),
            ),
            IconButton(
              onPressed: () => _onPressFunction(context),
              icon: Icon(
                isFromForm ? Icons.add : Icons.navigate_next,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );

    if (!isFromForm) {
      return Dismissible(
        key: ValueKey(location.hashCode),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          color: Theme.of(context).colorScheme.error,
          child: const Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (_) => _onSwipeFunction(context),
        child: tileContent,
      );
    }

    return tileContent;
  }
}
