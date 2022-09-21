import 'package:flutter/material.dart';
import 'package:harassmeet/data/user_data.dart' as model;
import 'package:harassmeet/providers/user_provider.dart';
import 'package:harassmeet/resources/firestore_methods.dart';
import 'package:harassmeet/utils/colors.dart';
import 'package:harassmeet/utils/global_variable.dart';
import 'package:harassmeet/utils/utils.dart';
import 'package:harassmeet/widgets/like_animation.dart';
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({
    Key? key,
    required this.snap,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  // int commentLen = 0;
  bool isLikeAnimating = false;

  // @override
  // void initState() {
  //   super.initState();
  //   fetchCommentLen();
  // }

  // fetchCommentLen() async {
  //   try {
  //     QuerySnapshot snap = await FirebaseFirestore.instance
  //         .collection('posts')
  //         .doc(widget.snap['postId'])
  //         .collection('comments')
  //         .get();
  //     commentLen = snap.docs.length;
  //   } catch (err) {
  //     showSnackBar(
  //       context,
  //       err.toString(),
  //     );
  //   }
  //   setState(() {});
  // }

  deletePost(String postId) async {
    try {
      await FireStoreMethods().deletePost(postId);
    } catch (err) {
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final model.User user = Provider.of<UserProvider>(context).getUser;
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: width > webScreenSize ? secondaryColor : mobileBackgroundColor,
        ),
        color: mobileBackgroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: primaryColor),
                children: [
                  TextSpan(
                    text: ' ${widget.snap['title']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: primaryColor),
                children: [
                  TextSpan(
                    text: ' ${widget.snap['description']}',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w800),
                  child: Text(
                    'ハラスメントだと思う ${widget.snap['agree'].length} 人',
                    style: Theme.of(context).textTheme.bodyText2,
                  )),
              LikeAnimation(
                isAnimating: widget.snap['agree'].contains(user.uid),
                smallLike: true,
                child: IconButton(
                  icon: widget.snap['agree'].contains(user.uid)
                      ? const Icon(
                          Icons.check_circle_outline,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.check_circle_outline,
                        ),
                  onPressed: widget.snap['disagree'].contains(user.uid)
                      ? null
                      : () => FireStoreMethods().likePost(
                            widget.snap['postId'].toString(),
                            user.uid,
                            widget.snap['agree'],
                          ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              DefaultTextStyle(
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2!
                      .copyWith(fontWeight: FontWeight.w800),
                  child: Text(
                    'ハラスメントだと思わない ${widget.snap['disagree'].length} 人',
                    style: Theme.of(context).textTheme.bodyText2,
                  )),
              LikeAnimation(
                isAnimating: widget.snap['disagree'].contains(user.uid),
                smallLike: true,
                child: IconButton(
                  icon: widget.snap['disagree'].contains(user.uid)
                      ? const Icon(
                          Icons.highlight_off,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.highlight_off,
                        ),
                  onPressed: widget.snap['agree'].contains(user.uid)
                      ? null
                      : () => FireStoreMethods().disagreePost(
                            widget.snap['postId'].toString(),
                            user.uid,
                            widget.snap['disagree'],
                          ),
                ),
              ),
              // IconButton(
              //   icon: const Icon(
              //     Icons.comment_outlined,
              //   ),
              //   onPressed: () => Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => CommentsScreen(
              //         postId: widget.snap['postId'].toString(),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       InkWell(
          //         child: Container(
          //           child: Text(
          //             '詳しくみる',
          //             style: const TextStyle(
          //               fontSize: 16,
          //               color: secondaryColor,
          //             ),
          //           ),
          //           padding: const EdgeInsets.symmetric(vertical: 4),
          //         ),
          //         onTap: () => Navigator.of(context).push(
          //           MaterialPageRoute(
          //             builder: (context) => CommentsScreen(
          //               postId: widget.snap['postId'].toString(),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
