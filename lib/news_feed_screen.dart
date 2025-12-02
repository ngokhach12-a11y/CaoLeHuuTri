// File: lib/news_feed_screen.dart
import 'package:flutter/material.dart';
import 'post_model.dart';         // Import file model
import 'create_post_screen.dart'; // Import file màn hình tạo bài

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  // Dữ liệu giả lập ban đầu
  List<Post> posts = [
    Post(name: "Người dùng cũ", content: "Đây là bài viết cũ...", time: "2 giờ trước"),
  ];

  // --- HÀM XỬ LÝ LOGIC ĐĂNG BÀI ---
  void _navigateToCreatePost() async {
    // 1. Chờ người dùng soạn thảo và bấm Đăng
    final newPostContent = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreatePostScreen()),
    );

    // 2. Nếu có nội dung trả về
    if (newPostContent != null && newPostContent.toString().isNotEmpty) {
      setState(() {
        // KỸ THUẬT: insert(0, ...) để chèn vào ĐẦU danh sách
        posts.insert(
          0, 
          Post(
            name: "Cao Lê Hữu Trí", 
            content: newPostContent,
            time: "Vừa xong"
          )
        );
      });
    }
  }
  // --------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Facebook Clone")),
      body: Column(
        children: [
          // Khu vực bấm để đăng bài
          InkWell(
            onTap: _navigateToCreatePost, 
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                children: [
                  const CircleAvatar(backgroundColor: Colors.grey),
                  const SizedBox(width: 10),
                  Text("Bạn đang nghĩ gì?", style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                ],
              ),
            ),
          ),
          
          // Danh sách cuộn (ListView)
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(backgroundColor: Colors.blue),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(post.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                                Text(post.time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(post.content, style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
