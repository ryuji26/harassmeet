import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String title;
  final String description;
  final String uid;
  final agree;
  final disagree;
  final String postId;
  final DateTime datePublished;
  const Post({
    required this.title,
    required this.description,
    required this.uid,
    required this.agree,
    required this.disagree,
    required this.postId,
    required this.datePublished,
  });

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      title: snapshot["title"],
      description: snapshot["description"],
      uid: snapshot["uid"],
      agree: snapshot["agree"],
      disagree: snapshot["disagree"],
      postId: snapshot["postId"],
      datePublished: snapshot["datePublished"],
    );
  }

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "uid": uid,
        "agree": agree,
        "disagree": disagree,
        "postId": postId,
        "datePublished": datePublished,
      };
}
