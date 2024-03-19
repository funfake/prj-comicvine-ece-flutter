// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_series_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicVineSeriesResponse _$ComicVineSeriesResponseFromJson(
        Map<String, dynamic> json) =>
    ComicVineSeriesResponse(
      (json['results'] as List<dynamic>)
          .map((e) => ComicVineSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineSeriesResponseToJson(
        ComicVineSeriesResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ComicVineSeries _$ComicVineSeriesFromJson(Map<String, dynamic> json) =>
    ComicVineSeries(
      id: json['id'] as int,
      name: json['name'] as String,
      image: ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      startYear: json['start_year'] as String,
      publisher: json['publisher'] as String,
      countOfEpisodes: json['count_of_episodes'] as int,
      characters: (json['characters'] as List<dynamic>)
          .map((e) => ComicVineCharacter.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      episodes: (json['episodes'] as List<dynamic>?)
          ?.map((e) => ComicVineEpisode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicVineSeriesToJson(ComicVineSeries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'start_year': instance.startYear,
      'publisher': instance.publisher,
      'count_of_episodes': instance.countOfEpisodes,
      'characters': instance.characters,
      'episodes': instance.episodes,
    };

ComicVineCharacter _$ComicVineCharacterFromJson(Map<String, dynamic> json) =>
    ComicVineCharacter(
      json['aliases'] as String?,
    );

Map<String, dynamic> _$ComicVineCharacterToJson(ComicVineCharacter instance) =>
    <String, dynamic>{
      'aliases': instance.aliases,
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
