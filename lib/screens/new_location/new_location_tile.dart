import 'package:flutter/material.dart';
import 'package:flutter_weather_project/models/location.dart';
import 'package:country_flags/country_flags.dart';
import 'package:flutter_weather_project/providers/location_provider.dart';
import 'package:provider/provider.dart';
import 'package:text_scroll/text_scroll.dart';

class NewLocationTile extends StatelessWidget {
  final Location location;
  const NewLocationTile({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 30)),
          ],
        ),
      ),
    );
  }
}
