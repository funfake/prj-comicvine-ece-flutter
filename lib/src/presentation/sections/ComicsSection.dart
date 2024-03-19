import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/bloc/comicvine_bloc.dart';
import 'package:comicvine/src/data/api/comicvine_api.dart';
import 'package:comicvine/src/data/models/comicvine_model.dart';
import 'package:comicvine/src/presentation/widgets/CardComponent.dart';
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
    return BlocBuilder<ComicVineBloc, ComicVineState>(
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

  Widget _getBody(ComicVineState state) {
    if (state is ComicVineLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is ComicVineSuccessState) {
      return ListView.builder(
        itemCount: state.response.results.length,
        itemBuilder: (context, index) {
          var issue = state.response.results[index];
          return CardComponent(
            title: issue.name ?? 'No name provided',
            composed_id: issue.composed_id.toString(),
            type: DetailType.issue,
            imageUrl: issue.image?.mediumUrl ?? 'https://comicvine.gamespot.com/a/uploads/scale_small/11/117763/2403520-ss16.png',
            isHorizontal: true,
          );
        },
      );
    } else if (state is ComicVineErrorState) {
      return Center(child: Text(state.exception.toString()));
    } else {
      return const SizedBox.shrink();
    }
  }
}
