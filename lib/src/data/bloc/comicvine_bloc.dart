import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/api/comicvine_api.dart';
import 'package:comicvine/src/data/models/comicvine_model.dart';

abstract class ComicVineEvent {}

class FetchDataEvent extends ComicVineEvent {}

abstract class ComicVineState {}

class ComicVineLoadingState extends ComicVineState {}

class ComicVineSuccessState extends ComicVineState {
  final ComicVineIssuesResponse response;

  ComicVineSuccessState(this.response);
}

class ComicVineErrorState extends ComicVineState {
  final dynamic exception;

  ComicVineErrorState(this.exception);
}

class ComicVineBloc extends Bloc<ComicVineEvent, ComicVineState> {
  ComicVineBloc() : super(ComicVineLoadingState()) {
    on<FetchDataEvent>((event, emit) async {
      emit(ComicVineLoadingState());
      try {
        ComicVineIssuesResponse response = await ComicVineRequests().getIssues();
        emit(ComicVineSuccessState(response));
      } catch (e) {
        emit(ComicVineErrorState(e));
      }
    });
  }
}