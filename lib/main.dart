import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/buy_page.dart';
import 'package:teplo_fest_humo/presentation/pages/splash_page/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Humo / Teplo Fest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff213774)),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}
