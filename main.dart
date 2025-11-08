import 'package:flutter/material.dart';
import 'screens/main_screen.dart';
import 'screens/splash_screen.dart'; // buat splash screen terpisah

void main() {
  runApp(const FinanceMateApp());
}

class FinanceMateApp extends StatelessWidget {
  const FinanceMateApp({super.key});

  @override
  Widget build(BuildContext context) {
    const burgundy = Color(0xFF800020);
    const white = Colors.white;

    return MaterialApp(
      title: 'Finance Mate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: burgundy,
          primary: burgundy,
          secondary: burgundy,
          background: white,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: white,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      // pertama kali buka tampilkan splash screen
      home: const SplashScreen(),
    );
  }
}
