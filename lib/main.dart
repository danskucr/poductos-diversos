import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:productos_diversos/constants/colors/palette.dart';
import 'constants/style/text_style.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Ubuntu',
          colorScheme: ColorScheme.fromSeed(
            seedColor: ColorsPalette().greenAquaPD,
            primary: ColorsPalette().blueDarkPD,
          ),
          primaryColor: ColorsPalette().blueDarkPD,
          appBarTheme: AppBarTheme(
          backgroundColor: ColorsPalette().whitePD,
          titleTextStyle: TextStyles().ubuntu22M),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: ColorsPalette().greenAquaPD,
              selectedItemColor: ColorsPalette().blueDarkPD,
          )
      ),
      title: 'Productos Diversos',
      home: InitialPage(),
    );
  }
}
