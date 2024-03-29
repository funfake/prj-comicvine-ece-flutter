import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  // @GET('issues')
  // Future<ComicVineIssuesResponse> getIssues(
  //     {@Query('limit') int limit = 20});

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

  Future<Map<String, dynamic>> fetchData(String url) async {
    try {
      // verify that the url is valid
      if (!Uri.parse(url).isAbsolute) {
        throw Exception('Invalid URL: $url');
      }

      final response = await Dio(
        BaseOptions(queryParameters: {
          'api_key': 'a110e5bfbb3fc1cc46648723406d2faba49952e5',
          'format': 'json',
        }),
      ).get(url);

      if (response.statusCode == 200) {
        return response.data as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load data from $url');
      }
    } catch (e) {
      throw Exception('Failed to load data from $url: $e');
    }
  }

  Future<Map<String, dynamic>> getIssues() async {
    return await fetchData('https://comicvine.gamespot.com/api/issues/');
  }

  Future<Map<String, dynamic>> getMovies() async {
    return await fetchData('https://comicvine.gamespot.com/api/movies/');
  }

  Future<Map<String, dynamic>> getSeries() async {
    return await fetchData('https://comicvine.gamespot.com/api/series_list/');
  }

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

  // Future<ComicVineIssuesResponse> getIssues() async {
  //   try {
  //     var response = await _api.getIssues();
  //     var filteredResults = response.results.where((issue) => issue.name != null && issue.name!.isNotEmpty).toList();
  //
  //     // Extract the composed_id from the api_detail_url and add it as a new field
  //     for (var issue in filteredResults) {
  //       if (issue.api_detail_url == null) {
  //         continue;
  //       }
  //       var match = RegExp(r'(\d+-\d+)').firstMatch(issue.api_detail_url!);
  //       if (match != null) {
  //         issue.composed_id = match.group(0);
  //       }
  //     }
  //
  //     return ComicVineIssuesResponse(results: filteredResults);
  //   } catch (e) {
  //     print(e);
  //     rethrow;
  //   }
  // }

  Future<ComicVineIssueResponse> getIssueById(String id) {
    try {
      return _api.getIssueById(id);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}