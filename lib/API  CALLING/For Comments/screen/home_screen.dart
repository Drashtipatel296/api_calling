import 'package:api_calling/API%20%20CALLING/For%20Comments/provider/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CommentsProvider>(
        builder: (context, commentsProvider, child) {
          return ListView(
            children: List.generate(
              commentsProvider.commentsList.length,
                  (index) => ListTile(
                leading: Column(
                  children: [
                    Text(
                      '${commentsProvider.commentsList[index].id}',
                    ),
                    Text(
                      '${commentsProvider.commentsList[index].postId}',
                    ),
                  ],
                ),
                title: Text(
                  overflow: TextOverflow.ellipsis,
                  commentsProvider.commentsList[index].name!,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      commentsProvider.commentsList[index].body!,
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      commentsProvider.commentsList[index].email!,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}