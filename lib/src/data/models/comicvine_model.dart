import 'package:json_annotation/json_annotation.dart';

part 'comicvine_model.g.dart';

@JsonSerializable()
class ComicVineCharactersResponse {
  @JsonKey(name: 'results')
  final List<ComicVineCharacter> results;

  ComicVineCharactersResponse(this.results);

  factory ComicVineCharactersResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineCharactersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineCharactersResponseToJson(this);
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
class ComicVineIssuesResponse {
  @JsonKey(name: 'results')
  final List<ComicVineIssue> results;

  ComicVineIssuesResponse({required this.results});

  factory ComicVineIssuesResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssuesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssuesResponseToJson(this);
}

@JsonSerializable()
class ComicVineIssueResponse {
  @JsonKey(name: 'result')
  final ComicVineIssue result;

  ComicVineIssueResponse(this.result);

  factory ComicVineIssueResponse.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssueResponseToJson(this);
}

@JsonSerializable()
class ComicVineIssue {
  @JsonKey(name: 'id')
  final int? id;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'description')
  final String? description;
  // @JsonKey(name: 'volume')
  // final String? volume;
  @JsonKey(name: 'image')
  final ComicVineImage? image;
  // @JsonKey(name: 'cover_date')
  // final String? coverDate;
  // @JsonKey(name: 'issue_number')
  // final String? issueNumber;

  // ComicVineIssue(this.id, this.name, this.description, this.volume, this.image, this.coverDate, this.issueNumber);
  ComicVineIssue(this.id, this.name, this.description, this.image);

  factory ComicVineIssue.fromJson(Map<String, dynamic> json) =>
      _$ComicVineIssueFromJson(json);

  Map<String, dynamic> toJson() => _$ComicVineIssueToJson(this);
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