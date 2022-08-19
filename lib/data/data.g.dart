// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostData _$$_PostDataFromJson(Map<String, dynamic> json) => _$_PostData(
      dateTime: DateTime.parse(json['dateTime'] as String),
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_PostDataToJson(_$_PostData instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'count': instance.count,
    };

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      email: json['email'] as String,
      uid: json['uid'] as String,
      photoUrl: json['photoUrl'] as String,
      username: json['username'] as String,
      bio: json['bio'] as String,
      followers: json['followers'] as List<dynamic>,
      following: json['following'] as List<dynamic>,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'photoUrl': instance.photoUrl,
      'username': instance.username,
      'bio': instance.bio,
      'followers': instance.followers,
      'following': instance.following,
    };
