import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/DynamicCardComponent.dart';
import 'package:comicvine/src/data/bloc/series_bloc.dart';
import 'dart:math';

class SeriesScrollComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesBloc, SeriesState>(
      builder: (context, state) {
        if (state is SeriesLoadingState) {
          return CircularProgressIndicator();
        } else if (state is SeriesSuccessState) {
          var results = state.response['results'];
          return HorizontalScrollComponent(
            title: 'Séries populaires',
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: min(15, results.length),
              itemBuilder: (context, index) {
                var serie = results[index];
                return DynamicCardComponent(
                  data: serie,
                );
              },
            ),
          );
        } else if (state is SeriesErrorState) {
          return Text('Error: ${state.exception}');
        } else {
          return Text('Unexpected state: $state');
        }
      },
    );
  }
}