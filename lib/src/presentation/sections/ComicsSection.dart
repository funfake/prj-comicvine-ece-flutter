import 'package:comicvine/src/presentation/widgets/CardComponent.dart';
import 'package:flutter/material.dart';
import 'package:comicvine/src/presentation/widgets/CardComponent.dart';

import 'package:comicvine/src/data/api/comicvine_api.dart';
import 'package:comicvine/src/data/models/comicvine_model.dart';

class ComicsSection extends StatefulWidget {
  const ComicsSection({super.key});

  @override
  _ComicsSectionState createState() => _ComicsSectionState();
}

class _ComicsSectionState extends State<ComicsSection> {
  ComicVineState _state = ComicVineLoadingState();

  @override
  void initState() {
    super.initState();

    // Si on souhaite lancer la requête dès l'ouverture de l'écran, sinon à enlever
    _sendRequest();
  }

  Future<void> _sendRequest() async {
    if (!mounted) return;

    setState(() => _state = ComicVineLoadingState());

    try {
      ComicVineIssuesResponse response = await ComicVineRequests().getIssues();
      if (!mounted) return;
      setState(() => _state = ComicVineSuccessState(response));
    } catch (e) {
      if (!mounted) return;
      setState(() => _state = ComicVineErrorState(e));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _state is ComicVineSuccessState
          ? ListView.builder(
        itemCount: (_state as ComicVineSuccessState).response.results.length,
        itemBuilder: (context, index) {
          var issue = (_state as ComicVineSuccessState).response.results[index];
          return CardComponent(
            title: issue.name ?? 'No name provided',
            id: issue.id.toString(),
            imageUrl: issue.image?.mediumUrl ?? 'https://comicvine.gamespot.com/a/uploads/scale_small/11/117763/2403520-ss16.png',
            isHorizontal: true,
          );
        },
      )
          : _state is ComicVineLoadingState
          ? const CircularProgressIndicator()
          : _state is ComicVineErrorState
          ? Text((_state as ComicVineErrorState).exception.toString())
          : Container(),
    );
  }
}

sealed class ComicVineState {}

class ComicVineLoadingState extends ComicVineState {}

class ComicVineSuccessState extends ComicVineState {
  final ComicVineIssuesResponse response;

  ComicVineSuccessState(this.response);
}

class ComicVineErrorState extends ComicVineState {
  final dynamic exception;

  ComicVineErrorState(this.exception);
}

