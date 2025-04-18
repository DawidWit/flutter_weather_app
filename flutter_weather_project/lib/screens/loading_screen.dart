import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      color: Theme.of(context).colorScheme.onPrimary,
      child: Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Theme.of(context).colorScheme.primary,
          size: 100,
        ),
      ),
    );
  }
}
