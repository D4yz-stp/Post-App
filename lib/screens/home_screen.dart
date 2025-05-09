
import 'package:flutter/material.dart';
import 'package:teste/screens/about_screen.dart';
import 'package:teste/screens/detail_screen.dart';
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
      bottomNavigationBar: _buildBottomNavigationBar()
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return _buildPostsList();
      case 1:
        return const AboutScreen();
      default:
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

  //used the same logic from my project 
  //in flutter haha, u just need to check
  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'About',
        ),
      ],
    );
  }

  void _gotoDetailScreen(Post post) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(post: post),
      ),
    );
  }
}