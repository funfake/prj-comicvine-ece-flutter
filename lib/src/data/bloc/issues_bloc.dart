import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:comicvine/src/data/api/comicvine_api.dart';
import 'package:comicvine/src/data/models/comicvine_model.dart';

abstract class IssuesEvent {}

class FetchIssuesEvent extends IssuesEvent {}

abstract class IssuesState {}

class IssuesLoadingState extends IssuesState {}

class IssuesSuccessState extends IssuesState {
  final Map<String, dynamic> response;

  IssuesSuccessState(this.response);
}

class IssuesErrorState extends IssuesState {
  final dynamic exception;

  IssuesErrorState(this.exception);
}

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  IssuesBloc() : super(IssuesLoadingState()) {
    on<FetchIssuesEvent>((event, emit) async {
      emit(IssuesLoadingState());
      try {
        Map<String, dynamic> response = await ComicVineRequests().getIssues();
        emit(IssuesSuccessState(response));
      } catch (e) {
        emit(IssuesErrorState(e));
      }
    });
  }
}