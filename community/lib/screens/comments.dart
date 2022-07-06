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
      body: Column(
        children: const [
          CommentList(),
        ],
      ),
    );
  }
}

class CommentList extends ConsumerWidget {
  const CommentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const postId = 'fake-post-id';
    final comments = ref.watch(getCommentsProvider(postId));

    return comments.when(
      data: (data) => Expanded(
        child: RefreshIndicator(
          onRefresh: () async => ref.refresh(getCommentsProvider(postId)),
          child: ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, idx) => Padding(
              padding: const EdgeInsets.all(8),
              child: Text(data[idx].content),
            ),
            separatorBuilder: (_, __) => const Divider(),
            itemCount: data.length,
          ),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      error: (err, stack) => Center(child: Text(err.toString())),
    );
  }
}
