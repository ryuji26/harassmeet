import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:harassmeet/data/user_data.dart';
import 'package:harassmeet/providers/user_provider.dart';
import 'package:harassmeet/resources/firestore_methods.dart';
import 'package:harassmeet/utils/colors.dart';
import 'package:harassmeet/utils/utils.dart';
import 'package:harassmeet/widgets/comment_card.dart';
import 'package:provider/provider.dart';

class CommentsScreen extends StatefulWidget {
  final postId;
  const CommentsScreen({Key? key, required this.postId}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController commentEditingController =
      TextEditingController();

  // void postComment(
  //   String uid,
  //   String name,
  // ) async {
  //   try {
  //     String res = await FireStoreMethods().postComment(
  //       widget.postId,
  //       commentEditingController.text,
  //       uid,
  //       name,
  //     );

  //     if (res != 'success') {
  //       showSnackBar(context, res);
  //     }
  //     setState(() {
  //       commentEditingController.text = "";
  //     });
  //   } catch (err) {
  //     showSnackBar(
  //       context,
  //       err.toString(),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          '詳細',
        ),
        centerTitle: false,
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('posts')
            .where('postId', isEqualTo: widget.postId)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            itemCount: (snapshot.data! as dynamic).docs.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              crossAxisSpacing: 5,
              mainAxisSpacing: 1.5,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              DocumentSnapshot snap = (snapshot.data! as dynamic).docs[index];

              return Column(
                children: [
                  const Text('タイトル'),
                  Text(
                    "${snap['title']}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Divider(),
                  const Text('相談内容'),
                  Text(
                    "${snap['description']}",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const Divider(),
                  Text(
                    'ハラスメントだと思う ${snap['agree'].length} 人',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'ハラスメントだと思わない ${snap['disagree'].length} 人',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              );
              // return Image(
              //   image: NetworkImage(snap['postUrl']),
              //   fit: BoxFit.cover,
              // );
            },
          );
        },
      ),
      // bottomNavigationBar: SafeArea(
      //   child: Container(
      //     height: kToolbarHeight,
      //     margin:
      //         EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      //     padding: const EdgeInsets.only(left: 16, right: 8),
      //     child: Row(
      //       children: [
      //         Expanded(
      //           child: Padding(
      //             padding: const EdgeInsets.only(left: 16, right: 8),
      //             child: TextField(
      //               controller: commentEditingController,
      //               decoration: const InputDecoration(
      //                 hintText: 'コメントを投稿する',
      //                 border: InputBorder.none,
      //               ),
      //             ),
      //           ),
      //         ),
      //         InkWell(
      //           onTap: () => postComment(
      //             user.uid,
      //             user.username,
      //           ),
      //           child: Container(
      //             padding:
      //                 const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      //             child: const Text(
      //               '投稿',
      //               style: TextStyle(color: Colors.blue),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
