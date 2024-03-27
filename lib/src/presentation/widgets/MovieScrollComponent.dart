import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/DynamicCardComponent.dart';
import 'package:comicvine/src/data/bloc/movies_bloc.dart';
import 'dart:math';

class MoviesScrollComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoadingState) {
          return CircularProgressIndicator();
        } else if (state is MoviesSuccessState) {
          var results = state.response['results'];
          return HorizontalScrollComponent(
            title: 'Films populaires',
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: min(15, results.length),
              itemBuilder: (context, index) {
                var movie = results[index];
                return DynamicCardComponent(
                  data: movie,
                );
              },
            ),
          );
        } else if (state is MoviesErrorState) {
          return Text('Error: ${state.exception}');
        } else {
          return Text('Unexpected state: $state');
        }
      },
    );
  }
}