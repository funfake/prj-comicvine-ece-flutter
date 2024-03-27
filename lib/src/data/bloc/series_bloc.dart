import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/api/comicvine_api.dart';

abstract class SeriesEvent {}

class FetchSeriesEvent extends SeriesEvent {}

abstract class SeriesState {}

class SeriesLoadingState extends SeriesState {}

class SeriesSuccessState extends SeriesState {
  final Map<String, dynamic> response;

  SeriesSuccessState(this.response);
}

class SeriesErrorState extends SeriesState {
  final dynamic exception;

  SeriesErrorState(this.exception);
}

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc() : super(SeriesLoadingState()) {
    on<FetchSeriesEvent>((event, emit) async {
      emit(SeriesLoadingState());
      try {
        Map<String, dynamic> response = await ComicVineRequests().getSeries();
        emit(SeriesSuccessState(response));
      } catch (e) {
        emit(SeriesErrorState(e));
      }
    });
  }
}