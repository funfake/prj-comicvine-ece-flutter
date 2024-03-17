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

ComicVineImage _$ComicVineImageFromJson(Map<String, dynamic> json) =>
    ComicVineImage(
      json['icon_url'] as String?,
      json['medium_url'] as String?,
      json['screen_url'] as String?,
      json['screen_large_url'] as String?,
      json['small_url'] as String?,
      json['super_url'] as String?,
      json['thumb_url'] as String?,
      json['tiny_url'] as String?,
      json['original_url'] as String?,
      json['image_tags'] as String?,
    );

Map<String, dynamic> _$ComicVineImageToJson(ComicVineImage instance) =>
    <String, dynamic>{
      'icon_url': instance.iconUrl,
      'medium_url': instance.mediumUrl,
      'screen_url': instance.screenUrl,
      'screen_large_url': instance.screenLargeUrl,
      'small_url': instance.smallUrl,
      'super_url': instance.superUrl,
      'thumb_url': instance.thumbUrl,
      'tiny_url': instance.tinyUrl,
      'original_url': instance.originalUrl,
      'image_tags': instance.imageTags,
    };
