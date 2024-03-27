import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';
import 'package:comicvine/src/presentation/screens/DetailsScreen.dart';
import 'package:comicvine/src/presentation/widgets/CardComponent.dart';
import 'package:comicvine/src/presentation/widgets/DynamicCardComponent.dart';
import 'package:comicvine/src/data/bloc/issues_bloc.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/MovieScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/SerieScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/IssuesScrollComponent.dart';

import 'dart:math';

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