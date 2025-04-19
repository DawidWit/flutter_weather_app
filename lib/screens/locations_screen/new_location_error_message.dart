import 'package:flutter/material.dart';

class NewLocationErrorMessage extends StatelessWidget {
  const NewLocationErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.find_in_page_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 65,
          ),
          const SizedBox(height: 16),
          Text(
            'There was an error while getting locations',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Please try again',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
