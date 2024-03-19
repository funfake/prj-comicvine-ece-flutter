import 'package:flutter/material.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';
import 'package:comicvine/src/data/models/CardType.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';
import 'package:comicvine/src/presentation/screens/DetailsScreen.dart';


class HomeSection extends StatefulWidget {
  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "Bienvenue !"),
        body: Column(
          children: [
            HorizontalScrollComponent(
              title: 'Comics populaires',
              type: DetailType.movie,
              cards: [
                CardElement(
                  title: 'Batman',
                  composed_id: '1-2',
                  imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/11/117763/2403520-ss16.png',
                ),
                CardElement(
                  title: 'Superman',
                  composed_id: '2-2',
                  imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/0/4/46617-3824-55260-1-wonder-woman.jpg',
                ),
                CardElement(
                  title: 'Batman',
                  composed_id: '1',
                  imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/11/117763/2403520-ss16.png',
                ),
                CardElement(
                  title: 'Superman',
                  composed_id: '2-2',
                  imageUrl: 'https://comicvine.gamespot.com/a/uploads/scale_small/0/4/46617-3824-55260-1-wonder-woman.jpg',
                ),
                // Add more CardElement widgets here...
              ],
            ),
            // Add more widgets here...
          ],
        ),
    );
  }
}