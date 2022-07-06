import 'dart:convert';

import 'package:community/models/comment.dart';
import 'package:http/http.dart' as http;

abstract class ICommentRepository {
  Future<List<Comment>> getComments();
}

class CommentRepository implements ICommentRepository {
  final _baseUrl = 'http://192.168.200.102:3000';
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "content-type": "application/json",
  };

  @override
  Future<List<Comment>> getComments() async {
    final url = '$_baseUrl/comments';
    final response = await http.get(Uri.parse(url), headers: _headers);
    final json = jsonDecode(response.body);
    final result = json.map<Comment>((item) => Comment.fromJson(item)).toList();

    return result;
  }
}
