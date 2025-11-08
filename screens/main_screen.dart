import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'report_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final Color burgundy = const Color(0xFF800020);
  final Color silver = const Color(0xFFC0C0C0);

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeScreen(), // ✅ kirim callback ke HomeScreen
      const ReportsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: burgundy,
        unselectedItemColor: silver,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
