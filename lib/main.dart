import 'package:flutter/material.dart';
import 'package:teplo_fest_humo/presentation/pages/buy_page/buy_page.dart';
import 'package:teplo_fest_humo/presentation/pages/splash_page/splash_page.dart';

import 'core/enums.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Humo / Teplo Fest',
      debugShowCheckedModeBanner: false,
      routes: {
        '/splash_page': (context) => const SplashPage(),
        '/buy_page': (context) => const BuyPage(lng: Lng.uz),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff213774)),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'Lato',
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
