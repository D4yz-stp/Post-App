
import 'package:flutter/material.dart';
import 'package:teste/widgets/post_list_item.dart';
import '../models/post.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Post> posts = List.generate(
    10,
    (index) => Post(id: index + 1, title: 'Post ${index + 1}'),
  );

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildPostsList();
    }
  }

  Widget _buildPostsList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostListItem(
          post: posts[index],
          onTap: () => _gotoDetailScreen(posts[index]),
        );
      },
    );
  }

  void _gotoDetailScreen(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => /* detail screen widget in work */,
      ),
    );
  }
}