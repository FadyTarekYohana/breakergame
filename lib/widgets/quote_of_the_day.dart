import 'dart:math';
import 'package:breakergame/services/remote_service.dart';
import 'package:flutter/material.dart';
import 'package:breakergame/domain/post.dart';

class QuoteOfTheDay extends StatefulWidget {
  QuoteOfTheDay({Key? key}) : super(key: key);

  @override
  State<QuoteOfTheDay> createState() => _QuoteOfTheDayState();
}

class _QuoteOfTheDayState extends State<QuoteOfTheDay> {
  List<Post> posts = <Post>[];

  String seed = DateTime.now().day.toString() +
      DateTime.now().month.toString() +
      DateTime.now().year.toString();

  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();
    if (posts.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isLoaded,
        replacement: const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            "Loading Quote Of The Day...",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            "${posts.isNotEmpty ? posts[Random(int.parse(seed)).nextInt(posts.length)].text : null}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ));
  }
}
