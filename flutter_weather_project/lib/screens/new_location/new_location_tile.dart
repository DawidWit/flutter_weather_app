import 'package:flutter/material.dart';
import 'package:flutter_weather_project/models/location.dart';

class NewLocationTile extends StatelessWidget {
  final Location location;
  const NewLocationTile({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 2.5,
        color: Theme.of(context).colorScheme.onInverseSurface,
        child: Text(location.fullLocationName),
      ),
    );
  }
}
