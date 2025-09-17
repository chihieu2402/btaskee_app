import 'package:btaskee_app/ui/home/home_page.dart';
import 'package:flutter/material.dart';

// void main() => runApp(const HomePage());

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'bTaskee Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        fontFamily: 'Roboto',
      ),
      home: const HomePage(),
    );
  }
}
