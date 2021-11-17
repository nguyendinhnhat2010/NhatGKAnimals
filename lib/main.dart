import 'package:flutter/material.dart';
import 'package:nguyendinhnhat_gk_animals/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animals App",
      home: ViewGame(),
    );
  }
}
