// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.text,
    required this.author,
  });

  String text;
  String author;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        text: json["text"],
        author: json["author"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "author": author,
      };
}
