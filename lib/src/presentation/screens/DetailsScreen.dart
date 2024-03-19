import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';

class DetailsScreen extends StatefulWidget {
  final String id;

  const DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Fetch the details of the comic issue, movie, or series using the id
    // Display the details
    return Scaffold(
      appBar: CustomAppBar(title: "Détails"),
      body: Center(
        child: Text('Détails de l\'élément avec l\'id ${widget.id}'),
      ),
    );
  }
}