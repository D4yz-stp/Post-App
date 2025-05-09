import 'package:flutter/material.dart';
import 'package:teste/models/comment.dart';
import '../models/post.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DetailScreen extends StatelessWidget {
  final Post post;

  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title} Details'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchComments(post.id), 
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No comments found.'));
          } else {
            // Se os dados forem carregados corretamente, mostramos os comentários
            List<dynamic> comments = snapshot.data!;
            return ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(comments[index]['name']),
                  subtitle: Text(comments[index]['body']), // A chave 'body' contém o texto do comentário
                );
              },
            );
          }
        },
      ),
    );
  }
}


Future<List<dynamic>> fetchComments(int postId) async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data;
  } else {
    throw Exception('Failed to load comments');
  }
}