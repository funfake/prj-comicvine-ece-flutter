import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/api/comicvine_api.dart';

abstract class MoviesEvent {}

class FetchMoviesEvent extends MoviesEvent {}

abstract class MoviesState {}

class MoviesLoadingState extends MoviesState {}

class MoviesSuccessState extends MoviesState {
  final Map<String, dynamic> response;

  MoviesSuccessState(this.response);
}

class MoviesErrorState extends MoviesState {
  final dynamic exception;

  MoviesErrorState(this.exception);
}

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesLoadingState()) {
    on<FetchMoviesEvent>((event, emit) async {
      emit(MoviesLoadingState());
      try {
        Map<String, dynamic> response = await ComicVineRequests().getMovies();
        emit(MoviesSuccessState(response));
      } catch (e) {
        emit(MoviesErrorState(e));
      }
    });
  }
}