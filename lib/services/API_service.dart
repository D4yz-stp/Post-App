import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/comment.dart';

class ApiService {
  // Fetch comments for a specific post
  static Future<List<Comment>> fetchComments(int postId) async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=$postId'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((data) => Comment.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load comments: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching comments: $e');
    }
  }
}