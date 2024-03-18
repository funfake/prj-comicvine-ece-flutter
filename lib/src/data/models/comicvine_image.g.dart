// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comicvine_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
