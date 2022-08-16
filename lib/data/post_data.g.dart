// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_data.dart';

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
