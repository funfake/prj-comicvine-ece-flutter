import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IssueHeaderDetail extends StatelessWidget {
  final dynamic results;

  IssueHeaderDetail({required this.results});

  @override
  Widget build(BuildContext context) {
    if (results['image'] != null && results['image']['medium_url'] != null && results['image']['medium_url'] is String &&
        results['volume'] != null && results['volume']['name'] != null && results['volume']['name'] is String &&
        results['issue_number'] != null && results['issue_number'] is String &&
        results['cover_date'] != null && results['cover_date'] is String) {

      // Parse the cover date
      DateTime coverDate = DateTime.parse(results['cover_date']);

      // Format the cover date to French month-year format
      String formattedCoverDate = DateFormat('MMMM yyyy', 'fr_FR').format(coverDate);

      return Row(
        children: [
          SizedBox(
            width: 94, // set the width of the image
            height: 127, // set the height of the image to be the same as the width
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.network(
                results['image']['medium_url'],
                fit: BoxFit.cover, // this will crop the image at the center
                alignment: Alignment.center, // this will align the image to the center
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                results['volume']['name'],
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              Row(
                children: [
                  const Icon(Icons.book),
                  const SizedBox(width: 5),
                  Text(
                    results['issue_number'],
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 5),
                  Text(
                    formattedCoverDate, // use the formatted cover date here
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      );
    } else {
      return Container(); // return an empty container if any of the fields is null or not a string
    }
  }
}