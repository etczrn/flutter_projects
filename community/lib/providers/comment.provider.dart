import 'package:community/models/comment.dart';
import 'package:community/repositories/comment.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentRepositoryProvider =
    Provider<ICommentRepository>((ref) => CommentRepository());

final getCommentsProvider = FutureProvider.autoDispose
    .family<List<Comment>, String>((ref, String postId) async {
  final repository = ref.watch(commentRepositoryProvider);

  return repository.getComments(postId);
});
