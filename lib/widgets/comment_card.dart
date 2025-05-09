import 'package:flutter/material.dart';
import '../models/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  const CommentCard({Key? key, required this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              comment.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              comment.email,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              comment.body,
              style: const TextStyle(fontSize: 15.0),
            ),
          ],
        ),
      ),
    );
  }
}