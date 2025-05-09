import 'package:flutter/material.dart';
import '../models/post.dart';
 

// simple detail screen widget just to see if its working 
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
      body: Center(
        child: Text('Details for ${post.title} will be displayed here'),
      ),
    );
  }
}