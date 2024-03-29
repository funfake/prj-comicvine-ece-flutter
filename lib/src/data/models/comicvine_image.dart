import 'package:json_annotation/json_annotation.dart';

part 'comicvine_image.g.dart';

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