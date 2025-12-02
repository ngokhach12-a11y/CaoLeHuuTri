// File: lib/create_post_screen.dart
import 'package:flutter/material.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController _controller = TextEditingController();

  // --- PHẦN NÀY LÀ MENU BẠN MUỐN SỬA ---
  void _showFilteredOptions() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Cho phép full màn hình nếu cần
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Thanh nắm kéo nhỏ màu xám
              Container(
                width: 40, height: 4, 
                margin: const EdgeInsets.only(bottom: 20), 
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))
              ),
              
              // --- DANH SÁCH ĐÃ LỌC (CHỈ CÒN 4 MỤC) ---
              _buildMenuItem(Icons.photo_library, Colors.green, "Ảnh/video"),
              _buildMenuItem(Icons.sentiment_satisfied_alt, Colors.amber, "Cảm xúc/hoạt động"),
              _buildMenuItem(Icons.location_on, Colors.red, "Check in"),
              _buildMenuItem(Icons.text_fields, Colors.tealAccent[700], "Màu nền"),
              
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  // Widget con để vẽ từng dòng menu cho gọn
  Widget _buildMenuItem(IconData icon, Color? color, String text) {
    return ListTile(
      leading: Icon(icon, color: color, size: 28),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.w500)),
      onTap: () {
        // Xử lý khi bấm vào (Ví dụ: in ra log)
        Navigator.pop(context); // Đóng menu
        print("Đã chọn: $text");
      },
    );
  }
  // ----------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tạo bài viết"),
        actions: [
          TextButton(
            onPressed: () {
              // Khi bấm ĐĂNG: Trả dữ liệu về màn hình trước
              Navigator.pop(context, _controller.text); 
            },
            child: const Text("Đăng", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: const InputDecoration(
                  hintText: "Bạn đang nghĩ gì?",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(border: Border(top: BorderSide(color: Colors.grey[300]!))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Thêm vào bài viết của bạn"),
                // Bấm vào icon này sẽ hiện Menu
                IconButton(
                  icon: const Icon(Icons.photo_library, color: Colors.green),
                  onPressed: _showFilteredOptions, 
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
