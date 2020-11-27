import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String username;
  final String password;

  Post({
    @required this.id,
    @required this.password,
    @required this.username,
  });

  factory Post.formjson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );
  }
}
