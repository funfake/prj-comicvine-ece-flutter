// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicVineCharactersResponse _$ComicVineCharactersResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineCharactersResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineCharactersResponseToJson(
        ComicVineCharactersResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicVineCharacter _$ComicVineCharacterFromJson(Map<String, dynamic> json) =>
    ComicVineCharacter(
      json['aliases'] as String?,
    );

Map<String, dynamic> _$ComicVineCharacterToJson(ComicVineCharacter instance) =>
    <String, dynamic>{
      'aliases': instance.aliases,
    };

ComicVineIssuesResponse _$ComicVineIssuesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineIssuesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => ComicVineIssue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineIssuesResponseToJson(
        ComicVineIssuesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicVineIssueResponse _$ComicVineIssueResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineIssueResponse(
      ComicVineIssue.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineIssueResponseToJson(
        ComicVineIssueResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

ComicVineIssue _$ComicVineIssueFromJson(Map<String, dynamic> json) =>
    ComicVineIssue(
      json['id'] as int?,
      json['name'] as String?,
      json['description'] as String?,
      json['image'] == null
          ? null
          : ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicVineIssueToJson(ComicVineIssue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
    };
