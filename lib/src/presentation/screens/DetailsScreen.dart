import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';

enum DetailType { issue, episode, movie }

class DetailsScreen extends StatefulWidget {
  final String composed_id;
  final DetailType type;

  const DetailsScreen({Key? key, required this.composed_id, required this.type}) : super(key: key);

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
        child: Text('Détails de l\'${widget.type} avec l\'id ${widget.composed_id}'),
      ),
    );
  }
}