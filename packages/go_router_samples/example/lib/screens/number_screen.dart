import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key, required this.number});

  final String number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 16,
            top: 32,
            child: IconButton(
              onPressed: () => GoRouter.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
              iconSize: 36,
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('You have selected id'),
                Text(
                  number,
                  style: const TextStyle(
                      fontSize: 36, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
