import 'package:flutter/material.dart';

class NoLocationsScreen extends StatelessWidget {
  const NoLocationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.5,
        title: Text(
          'SELECT LOCATION',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
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
