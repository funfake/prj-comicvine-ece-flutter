import 'package:flutter/material.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Container(
                // margin: EdgeInsets.only(left: 0),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          HorizontalScrollComponent(
            title: 'Comics populaires',
            cardTitles: [
              'Batman',
              'Superman',
              'Batman',
              'Superman',
              'Batman',
              'Superman',
              'Batman',
              'Superman',
            ],
          ),
          HorizontalScrollComponent(
            title: 'Films populaires',
            cardTitles: [
              'Batman',
              'Superman',
              'Batman',
              'Superman',
              'Batman',
              'Superman',
              'Batman',
              'Superman',
            ],
          ),
        ]
      ),
    );
  }
}