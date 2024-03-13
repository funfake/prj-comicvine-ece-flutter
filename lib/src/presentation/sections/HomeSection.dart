import 'package:flutter/material.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';
import 'package:comicvine/src/data/models/CardType.dart';

class HomeSection extends StatefulWidget {
  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
            // Add more CardElement widgets here...
          ],
        ),
        // Add more widgets here...
      ],
    );
  }
}