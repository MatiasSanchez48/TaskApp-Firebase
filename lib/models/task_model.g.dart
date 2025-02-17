// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MTaskImpl _$$MTaskImplFromJson(Map<String, dynamic> json) => _$MTaskImpl(
      name: json['name'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      email: json['email'] as String,
      color: json['color'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      state: (json['state'] as num).toInt(),
      authorUid: json['authorUid'] as String,
      uid: json['uid'] as String?,
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
    );

Map<String, dynamic> _$$MTaskImplToJson(_$MTaskImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'title': instance.title,
      'description': instance.description,
      'email': instance.email,
      'color': instance.color,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'state': instance.state,
      'authorUid': instance.authorUid,
      'uid': instance.uid,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
