import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account Selector',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showAccountDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.folder_shared, size: 48, color: Colors.orange),
                const SizedBox(height: 12),
                const Text(
                  "Chọn tài khoản",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "để tiếp tục sử dụng bTaskee",
                  style: TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 16),

                // List account
                _buildAccountTile("Lê Phước Hưng", "hungkamelako@gmail.com",
                    "https://maunaildep.com/wp-content/uploads/2025/04/anh-trai-dep-2k9-sieu-dang-yeu.jpg"),
                _buildAccountTile("Hưng Lê Phước", "lephuochung220404@gmail.com",
                    "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-1/482130274_1182328513345216_8972525534939440008_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=109&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeFFht8vrFq8uMTD26fXjyyF5Dg8IJHkZJ7kODwgkeRknmbLG4Bj3mO-7UaBWPjkcWj1HERDHyUUuiXxjHwGjO1W&_nc_ohc=vV8kqqtS3ZgQ7kNvwEJf9R3&_nc_oc=AdlS87Y_NQL9mbXvRub7Er-E5rfMUchp8KXEqsZTJP4AWUMwVzSbZ7p4GioWhkJ14hM&_nc_zt=24&_nc_ht=scontent.fsgn5-8.fna&_nc_gid=9UTtrrka1Ev4k54ce5qOKw&oh=00_AfY5gK2Bv-NZlytoqQCUUSmPoMKtdDBUlDlCGFRL8K9iYg&oe=68C857FA"),
                _buildAccountTile("Nui Cao", "heritagenuicao1@gmail.com",
                    "https://nld.mediacdn.vn/291774122806476800/2025/9/10/chia-se-moi-nhat-cua-thien-an-giua-luc-phia-jack-co-loat-dong-thai-an-y-0adf19d026dd4efe822b8914d3b44da9-176-175746808385481578721.jpg"),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.add_circle_outline),
                  title: const Text("Thêm tài khoản khác"),
                  onTap: () {},
                ),

                const SizedBox(height: 12),
                const Text(
                  "Để tiếp tục, Google sẽ chia sẻ tên, địa chỉ email "
                      "và ảnh hồ sơ của bạn với bTaskee.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAccountTile(String name, String email, String avatarUrl) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(name),
      subtitle: Text(email),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Mở chọn tài khoản"),
          onPressed: () => _showAccountDialog(context),
        ),
      ),
    );
  }
}
