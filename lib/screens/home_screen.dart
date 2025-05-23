
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
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(post: post),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;
        
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ),
  );
}
}