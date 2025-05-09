
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(
            'Best Android Post app ever',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Divaldo',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 8),
          Text(
            'divaldodias849@gmail.com',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}