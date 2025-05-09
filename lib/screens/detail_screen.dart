import 'package:flutter/material.dart';
import 'package:teste/models/comment.dart';
import 'package:teste/services/API_service.dart';
import 'package:teste/widgets/comment_card.dart';
import '../models/post.dart';


class DetailScreen extends StatefulWidget {
  final Post post;

  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenEstado();
}

class _DetailScreenEstado extends State<DetailScreen> {
  late Future<List<Comment>> futureComments;

  @override
  void initState() {
    super.initState();
    
    futureComments = ApiService.fetchComments(widget.post.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.post.title} Details'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            const Text(
              'Comments:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: FutureBuilder<List<Comment>>(
                future: futureComments,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        'Error loading comments: ${snapshot.error}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('No comments found for this post.'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final comment = snapshot.data![index];
                        return CommentCard(comment: comment);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}