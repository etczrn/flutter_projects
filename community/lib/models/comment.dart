// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable(explicitToJson: true)
class Comment {
  Comment({
    required this.id,
    required this.userId,
    required this.content,
    required this.likes,
    required this.createdAt,
    required this.updatedAt,
    required this.isUpdated,
    required this.replies,
  });

  String id;
  String userId;
  String content;
  int likes;
  DateTime createdAt;
  DateTime updatedAt;
  bool isUpdated;
  List<Comment>? replies;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
