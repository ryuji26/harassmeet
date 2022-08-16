import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:harassmeet/data/post_data.dart';

class PostDataDao {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('collection_post');

  void savePostData(PostData postData) {
    _collection.add(postData.toJson());
  }
}
