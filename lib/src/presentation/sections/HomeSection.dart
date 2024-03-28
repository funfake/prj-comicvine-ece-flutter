import 'package:flutter/material.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';
import 'package:comicvine/src/presentation/widgets/MovieScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/SerieScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/IssuesScrollComponent.dart';

class HomeSection extends StatefulWidget {
  @override
  _HomeSectionState createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Bienvenue !"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IssuesScrollComponent(),
            MoviesScrollComponent(),
            SeriesScrollComponent(),
          ],
        ),
      ),
    );
  }
}