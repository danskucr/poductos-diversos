import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'data/API/firebase_messaging.dart';
import 'presentation/initial_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  await  FirebaseApi().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Productos Diversos',
      home: InitialPage(),
    );
  }
}
