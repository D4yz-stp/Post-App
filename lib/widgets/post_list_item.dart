
import 'package:flutter/material.dart';
import '../models/post.dart';

class PostListItem extends StatelessWidget {
  final Post post;
  final VoidCallback onTap;

  const PostListItem({
    Key? key,
    required this.post,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        title: Text(
          post.title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16.0),
        onTap: onTap,
      ),
    );
  }
}