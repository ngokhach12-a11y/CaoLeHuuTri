// File: lib/main.dart
import 'package:flutter/material.dart';
import 'news_feed_screen.dart'; // Import màn hình trang chủ

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewsFeedScreen(),
  ));
}
