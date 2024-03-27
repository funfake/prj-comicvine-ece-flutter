import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/presentation/widgets/HorizontalScrollComponent.dart';
import 'package:comicvine/src/presentation/widgets/DynamicCardComponent.dart';
import 'package:comicvine/src/data/bloc/issues_bloc.dart';
import 'dart:math';

class IssuesScrollComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssuesBloc, IssuesState>(
      builder: (context, state) {
        if (state is IssuesLoadingState) {
          return CircularProgressIndicator();
        } else if (state is IssuesSuccessState) {
          var results = state.response['results'];
          return HorizontalScrollComponent(
            title: 'Comics populaires',
            height: 225,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: min(30, results.length),
              itemBuilder: (context, index) {
                var issue = results[index];
                return DynamicCardComponent(
                  data: issue,
                );
              },
            ),
          );
        } else if (state is IssuesErrorState) {
          return Text('Error: ${state.exception}');
        } else {
          return Text('Unexpected state: $state');
        }
      },
    );
  }
}