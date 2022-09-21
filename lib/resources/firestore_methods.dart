import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:harassmeet/data/post.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
    String title,
    String description,
    String uid,
  ) async {
    String res = "Some error occurred";
    try {
      String postId = const Uuid().v1();
      Post post = Post(
        title: title,
        description: description,
        uid: uid,
        agree: [],
        disagree: [],
        postId: postId,
        datePublished: DateTime.now(),
      );
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> likePost(String postId, String uid, List agree) async {
    String res = "Some error occurred";
    try {
      if (agree.contains(uid)) {
        // Firestoreのagreeにuidがある場合削除する
        _firestore.collection('posts').doc(postId).update({
          'agree': FieldValue.arrayRemove([uid])
        });
      } else {
        // uidをagreeに追加
        _firestore.collection('posts').doc(postId).update({
          'agree': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> disagreePost(String postId, String uid, List agree) async {
    String res = "Some error occurred";
    try {
      if (agree.contains(uid)) {
        // Firestoreのdisagreeにuidがある場合削除する
        _firestore.collection('posts').doc(postId).update({
          'disagree': FieldValue.arrayRemove([uid])
        });
      } else {
        // uidをdisagreeに追加
        _firestore.collection('posts').doc(postId).update({
          'disagree': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> postComment(
      String postId, String text, String uid, String name) async {
    String res = "Some error occurred";
    try {
      if (text.isNotEmpty) {
        String commentId = const Uuid().v1();
        _firestore
            .collection('posts')
            .doc(postId)
            .collection('comments')
            .doc(commentId)
            .set({
          'name': name,
          'uid': uid,
          'text': text,
          'commentId': commentId,
          'datePublished': DateTime.now(),
        });
        res = 'success';
      } else {
        res = "コメントを入力してください";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> deletePost(String postId) async {
    String res = "Some error occurred";
    try {
      await _firestore.collection('posts').doc(postId).delete();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'followers': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
