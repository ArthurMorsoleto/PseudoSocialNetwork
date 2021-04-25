import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pseudo_social_network/model/Post.dart';
import 'package:pseudo_social_network/model/comment.dart';
import 'package:pseudo_social_network/model/user.dart';

const _BASE_URL = "https://jsonplaceholder.typicode.com";

class PlaceHolderService {
  Future<List<Post>> getPosts() async {
    var response = await http.get('$_BASE_URL/posts');
    if (response.statusCode == HttpStatus.ok) {
      var objs = jsonDecode(response.body) as List;
      var posts = objs.map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception("Request Error: getPosts() " + response.toString());
    }
  }

  Future<User> getUserProfile() async {
    var response = await http.get('$_BASE_URL/users/1');
    if (response.statusCode == HttpStatus.ok) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Request Error: getUserProfile() " + response.toString());
    }
  }

  Future<List<Comment>> getPostComments(int postId) async {
    var response = await http.get('$_BASE_URL/posts/$postId/comments');
    if (response.statusCode == HttpStatus.ok) {
      var objs = jsonDecode(response.body) as List;
      return objs.map((obj) => Comment.fromJson(obj)).toList();
    } else {
      throw Exception(
          "Request Error: getPostComments() " + response.toString());
    }
  }
}
