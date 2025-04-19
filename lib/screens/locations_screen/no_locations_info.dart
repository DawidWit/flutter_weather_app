import 'package:flutter/material.dart';

class NoLocationsInfo extends StatelessWidget {
  const NoLocationsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
