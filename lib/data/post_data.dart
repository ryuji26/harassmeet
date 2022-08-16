import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

@freezed
class PostData with _$PostData {
  const factory PostData({
    required DateTime dateTime,
    required int count,
  }) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}
