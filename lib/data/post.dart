import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final likes;
  final disagree;
  final String postId;
  final DateTime datePublished;
  const Post({
    required this.description,
    required this.uid,
    required this.likes,
    required this.disagree,
    required this.postId,
    required this.datePublished,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      description: snapshot["description"],
      uid: snapshot["uid"],
      likes: snapshot["likes"],
      disagree: snapshot["disagree"],
      postId: snapshot["postId"],
      datePublished: snapshot["datePublished"],
    );
  }

  Map<String, dynamic> toJson() => {
        "description": description,
        "uid": uid,
        "likes": likes,
        "disagree": disagree,
        "postId": postId,
        "datePublished": datePublished,
      };
}
