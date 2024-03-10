import 'package:flutter/material.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';
import 'package:comicvine/src/data/models/CardType.dart';

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
            cards: [
              CardElement(
                title: 'Batman',
                id: '1',
                imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/11/117763/2403520-ss16.png',
              ),
              CardElement(
                title: 'Superman',
                id: '2',
                imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/0/4/46617-3824-55260-1-wonder-woman.jpg',
              ),
              CardElement(
                title: 'Batman',
                id: '1',
                imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/11/117763/2403520-ss16.png',
              ),
              CardElement(
                title: 'Superman',
                id: '2',
                imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/0/4/46617-3824-55260-1-wonder-woman.jpg',
              ),
            ],
          ),
        ]
      ),
    );
  }
}