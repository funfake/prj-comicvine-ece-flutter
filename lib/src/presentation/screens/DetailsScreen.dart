import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';

enum DetailType { issue, episode, movie }

class DetailsScreen extends StatefulWidget {
  final String api_detail_url;

  const DetailsScreen({Key? key, required this.api_detail_url}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Use widget.type to determine which API call to make
    // Fetch the details of the comic issue, movie, or series using the id
    // Display the details
    return Scaffold(
      appBar: CustomAppBar(title: "Détails"),
      body: Center(
        child: Text('Détails de ${widget.api_detail_url}'),
      ),
    );
  }
}