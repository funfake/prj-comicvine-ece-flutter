import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/bloc/issues_bloc.dart';
import 'package:comicvine/src/data/api/comicvine_api.dart';
import 'package:comicvine/src/data/models/comicvine_model.dart';
import 'package:comicvine/src/presentation/widgets/DynamicCardComponent.dart';
import 'package:comicvine/src/presentation/widgets/CustomAppBar.dart';
import 'package:comicvine/src/presentation/screens/DetailsScreen.dart';


class ComicsSection extends StatefulWidget {
  const ComicsSection({Key? key}) : super(key: key);

  @override
  _ComicsSectionState createState() => _ComicsSectionState();
}

class _ComicsSectionState extends State<ComicsSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IssuesBloc, IssuesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(title: "Comics les plus populaires"),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child:
            _getBody(state),
          ),
        );
      },
    );
  }

  Widget _getBody(IssuesState state) {
    if (state is IssuesLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is IssuesSuccessState) {
      var results = state.response['results'];
      return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          var issue = results[index];
          return DynamicCardComponent(
            data: issue,
            isHorizontal: true,
          );
        },
      );
    } else if (state is IssuesErrorState) {
      return Center(child: Text(state.exception.toString()));
    } else {
      return const SizedBox.shrink();
    }
  }
}