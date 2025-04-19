import 'package:flutter/material.dart';
import 'package:flutter_weather_project/screens/new_location/new_location.dart';

class NoLocationsScreen extends StatelessWidget {
  const NoLocationsScreen({super.key});

  void _showAddForm(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewLocationForm(),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.wysiwyg_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 10),
            Text("OOPS!", style: Theme.of(context).textTheme.displaySmall),
            Text(
              "Seems like no location is added...",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              "Try adding one now!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
