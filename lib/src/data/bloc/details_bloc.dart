import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/api/comicvine_api.dart';

abstract class DetailsEvent {}

class FetchDetailsEvent extends DetailsEvent {
  final String url;

  FetchDetailsEvent(this.url);
}

abstract class DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  final Map<String, dynamic> response;

  DetailsSuccessState(this.response);
}

class DetailsErrorState extends DetailsState {
  final dynamic exception;

  DetailsErrorState(this.exception);
}

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsLoadingState()) {
    on<FetchDetailsEvent>((event, emit) async {
      emit(DetailsLoadingState());
      try {
        Map<String, dynamic> response = await ComicVineRequests().fetchData(event.url);
        emit(DetailsSuccessState(response));
      } catch (e) {
        emit(DetailsErrorState(e));
      }
    });
  }
}