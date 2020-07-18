// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return Author(
    id: json['id'] as String,
    //created_at: json['created_at'] as String,
    urls: json['urls'] == null
        ? null
        : Urls.fromJson(json['urls'] as Map<String, dynamic>),

    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),

  );
}

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
      'id': instance.id,
      //'created_at': instance.created_at,
      'urls': instance.urls?.toJson(),
      'user': instance.user?.toJson(),
    };
