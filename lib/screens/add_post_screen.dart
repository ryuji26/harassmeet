import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:harassmeet/providers/user_provider.dart';
import 'package:harassmeet/resources/firestore_methods.dart';
import 'package:harassmeet/utils/colors.dart';
import 'package:harassmeet/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  void postImage(
    String uid,
    String username,
  ) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        uid,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Posted!',
        );
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: const Text(
          '相談を作成する',
        ),
        centerTitle: false,
        actions: <Widget>[
          TextButton(
            onPressed: () => postImage(
              userProvider.getUser.uid,
              userProvider.getUser.username,
            ),
            child: const Text(
              "投稿",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          )
        ],
      ),
      // POST FORM
      body: Column(
        children: <Widget>[
          isLoading
              ? const LinearProgressIndicator()
              : const Padding(padding: EdgeInsets.only(top: 0.0)),
          const Divider(),
          Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                      hintText: "ルーム名", border: InputBorder.none),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        postImage(
                          userProvider.getUser.uid,
                          userProvider.getUser.username,
                        );
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "投稿する",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ))
              ],
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
