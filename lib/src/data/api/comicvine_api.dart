import 'package:dio/dio.dart';
import 'package:comicvine/src/data/models/comicvine_model.dart';
import 'package:retrofit/retrofit.dart';
import 'dart:convert';
part 'comicvine_api.g.dart';

@RestApi()
abstract class ComicVineAPI {
  factory ComicVineAPI(Dio dio, {required String baseUrl}) = _ComicVineAPI;

  @GET('characters')
  Future<ComicVineCharactersResponse> loadCharacters(
      {@Query('limit') int limit = 20});

  @GET('issues')
  Future<ComicVineIssuesResponse> getIssues(
      {@Query('limit') int limit = 20});

  @GET('issues/{id}')
  Future<ComicVineIssueResponse> getIssueById(@Path('id') String id);
}

class ComicVineRequests {
  /// Singleton
  static final ComicVineRequests _singleton = ComicVineRequests._internal();

  factory ComicVineRequests() {
    return _singleton;
  }

  ComicVineRequests._internal();

  final ComicVineAPI _api = ComicVineAPI(
    Dio(
      BaseOptions(queryParameters: {
        'api_key': 'a110e5bfbb3fc1cc46648723406d2faba49952e5',
        'format': 'json',
      }),
    ),
    baseUrl: 'https://comicvine.gamespot.com/api/',
  );

  Future<ComicVineCharactersResponse> getCharacters() {
    try {
      return _api.loadCharacters(limit: 20);
    } catch (e) {
        print(e);
      rethrow;
    }
  }

  Future<ComicVineCharactersResponse> getCharactersWithLimit(int limit) {
    try {
      return _api.loadCharacters(limit: limit);
    } catch (e) {
        print(e);
      rethrow;
    }
  }

  Future<ComicVineIssuesResponse> getIssues() async {
    try {
      var response = await _api.getIssues();
      // var resultsJson = jsonEncode(response.results.map((issue) => issue.toJson()).toList());
      // print(resultsJson);
      var filteredResults = response.results.where((issue) => issue.name != null && issue.name!.isNotEmpty).toList();
      return ComicVineIssuesResponse(results: filteredResults);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ComicVineIssueResponse> getIssueById(String id) {
    try {
      return _api.getIssueById(id);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}