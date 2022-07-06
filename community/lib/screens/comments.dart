import 'package:community/providers/comment.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: const CommentList(),
    );
  }
}

class CommentList extends ConsumerWidget {
  const CommentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsList = ref.watch(getCommentsProvider);
    return commentsList.when(
      data: (comments) => ListView.separated(
        itemBuilder: (context, idx) => Padding(
          padding: const EdgeInsets.all(8),
          child: Text(comments[idx].content),
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: comments.length,
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Center(child: Text(err.toString())),
    );
  }
}
