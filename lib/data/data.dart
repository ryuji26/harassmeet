import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class PostData with _$PostData {
  const factory PostData({
    required DateTime dateTime,
    required int count,
  }) = _PostData;

  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
}

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String email,
    required String uid,
    required String photoUrl,
    required String username,
    required String bio,
    required List followers,
    required List following,
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
