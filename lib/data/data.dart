import 'package:cloud_firestore/cloud_firestore.dart';
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

  factory UserData.fromDocument(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return _UserData(
        email: snapshot['email'],
        uid: snapshot['uid'],
        photoUrl: snapshot['photoUrl'],
        username: snapshot['username'],
        bio: snapshot['bio'],
        followers: snapshot['followers'],
        following: snapshot['following']);
  }
}
