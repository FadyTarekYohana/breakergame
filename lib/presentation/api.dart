import 'dart:html';
import 'dart:ui';

import 'package:breakergame/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:breakergame/models/post.dart';

class api extends StatelessWidget {
  api({Key? key}) : super(key: key);
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    //fetch data from api
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts != null) {
      isLoaded = true;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Text(posts![index].title),
            );
          },
        ),
      ),
    );
  }
}
