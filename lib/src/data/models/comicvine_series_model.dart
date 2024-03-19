import 'package:json_annotation/json_annotation.dart';
import 'comicvine_episode_model.dart';

part 'comicvine_series_model.g.dart';

@JsonSerializable()
class ComicVineSeriesResponse {
  @JsonKey(name: 'results')
  final List<ComicVineSeries> results;

  ComicVineSeriesResponse(this.results);

  factory ComicVineSeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineSeriesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineSeriesResponseToJson(this);
}

@JsonSerializable()
class ComicVineSeries {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String? description;
  @JsonKey(name: 'image')
  final ComicVineImage image;
  @JsonKey(name: 'start_year')
  final String startYear;
  @JsonKey(name: 'publisher')
  final String publisher;
  @JsonKey(name: 'count_of_episodes')
  final int countOfEpisodes;
  @JsonKey(name: 'characters')
  final List<ComicVineCharacter> characters;
  List<ComicVineEpisode>? episodes;

  ComicVineSeries({
    required this.id,
    required this.name,
    required this.image,
    required this.startYear,
    required this.publisher,
    required this.countOfEpisodes,
    required this.characters,
    this.description,
    this.episodes,
  });

  factory ComicVineSeries.fromJson(Map<String, dynamic> json) {
    final episodesJson = json['episodes'] as List<dynamic>?; // Récupérez les données JSON des épisodes
    List<ComicVineEpisode>? episodes;
    if (episodesJson != null) {
      episodes = episodesJson.map((episodeJson) => ComicVineEpisode.fromJson(episodeJson)).toList();
    }
    return ComicVineSeries(
      id: json['id'] as int,
      name: json['name'] as String,
      image: ComicVineImage.fromJson(json['image'] as Map<String, dynamic>),
      startYear: json['start_year'] as String,
      publisher: json['publisher'] as String,
      countOfEpisodes: json['count_of_episodes'] as int,
      characters: (json['characters'] as List<dynamic>).map((characterJson) => ComicVineCharacter.fromJson(characterJson)).toList(),
      description: json['description'] as String?,
      episodes: episodes, // Assignez les épisodes récupérés
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'image': image.toJson(),
    'start_year': startYear,
    'publisher': publisher,
    'count_of_episodes': countOfEpisodes,
    'characters': characters.map((character) => character.toJson()).toList(),
    'episodes': episodes?.map((episode) => episode.toJson()).toList(), // Convertissez les épisodes en JSON
  };
}

@JsonSerializable()
class ComicVineCharacter {
  @JsonKey(name: 'aliases')
  final String? aliases;

  ComicVineCharacter(this.aliases);

  factory ComicVineCharacter.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharacterFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharacterToJson(this);
}

@JsonSerializable()
class ComicVineImage {
  @JsonKey(name: 'icon_url')
  final String? iconUrl;
  @JsonKey(name: 'medium_url')
  final String? mediumUrl;
  @JsonKey(name: 'screen_url')
  final String? screenUrl;
  @JsonKey(name: 'screen_large_url')
  final String? screenLargeUrl;
  @JsonKey(name: 'small_url')
  final String? smallUrl;
  @JsonKey(name: 'super_url')
  final String? superUrl;
  @JsonKey(name: 'thumb_url')
  final String? thumbUrl;
  @JsonKey(name: 'tiny_url')
  final String? tinyUrl;
  @JsonKey(name: 'original_url')
  final String? originalUrl;
  @JsonKey(name: 'image_tags')
  final String? imageTags;

  ComicVineImage(this.iconUrl, this.mediumUrl, this.screenUrl, this.screenLargeUrl, this.smallUrl, this.superUrl, this.thumbUrl, this.tinyUrl, this.originalUrl, this.imageTags);

  factory ComicVineImage.fromJson(Map<String, dynamic> json) =>
      _$ComicVineImageFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineImageToJson(this);
}
