import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final GoRouter goRouter;

  DetailsScreen({required this.goRouter, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => context.go('/'),
            child: const Text('Go back to the Home screen'),
          ),
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}