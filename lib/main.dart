import 'package:flutter/material.dart';
import 'utils/initial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos Diversos',
      home: const InitialPage(),
    );
  }
}
