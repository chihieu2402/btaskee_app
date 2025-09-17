import 'package:btaskee_app/ui/login/test_login_gg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> banners = [
    'https://via.placeholder.com/400x200.png?text=Banner+1',
    'https://via.placeholder.com/400x200.png?text=Banner+2',
    'https://via.placeholder.com/400x200.png?text=Banner+3',
  ];

  final List<Map<String, dynamic>> services = [
    {"title": "Dọn dẹp nhà ca lẻ", "icon": Icons.cleaning_services},
    {"title": "Dọn dẹp nhà gói tháng", "icon": Icons.calendar_month},
    {"title": "Tổng vệ sinh", "icon": Icons.house},
    {"title": "Dịch vụ chuyển nhà", "icon": Icons.local_shipping, "new": true},
    {"title": "Vệ sinh công nghiệp", "icon": Icons.apartment, "new": true},
    {"title": "Vệ sinh máy lạnh", "icon": Icons.ac_unit},
    {"title": "Vệ sinh Sofa", "icon": Icons.chair},
    {"title": "Trông Trẻ", "icon": Icons.child_care},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        // title: const Text("Xin chào Chí Hiếu"),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: const [
                Icon(Icons.flag, color: Colors.red),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Widget đăng nhập / tạo tài khoản
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hãy khám phá và trải nghiệm các dịch vụ gia đình ngay hôm nay.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginApp()),
                        );
                      },
                      child: const Text(
                        "Đăng nhập / Tạo tài khoản",
                        style: TextStyle(color: Colors.green, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Phần ví tiền / điểm
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.orange[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Text("0 đ"),
                  Text("0 bPoints"),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 Tiêu đề dịch vụ
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Dịch vụ",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("Xem tất cả", style: TextStyle(color: Colors.green)),
                ],
              ),
            ),

            // 🔹 Lưới dịch vụ
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.orange[50],
                          child: Icon(service["icon"],
                              color: Colors.orange, size: 28),
                        ),
                        if (service["new"] == true)
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text("NEW",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10)),
                            ),
                          )
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      service["title"],
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),

      // 🔹 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Trang chủ'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Hoạt động'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Cộng đồng'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Tin nhắn'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Tài khoản'),
        ],
      ),
    );
  }
}
