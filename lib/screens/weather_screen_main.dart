import 'package:flutter/material.dart';

class WeatherScreenMain extends StatelessWidget {
  const WeatherScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).maybePop();
          },
        ),
      ),
    );
  }
}
