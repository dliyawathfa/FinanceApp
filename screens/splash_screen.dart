import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'home_screen.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fade = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _scale = CurvedAnimation(parent: _controller, curve: Curves.easeOutBack);

    _controller.forward();

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MainScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 4),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF800020), Color(0xFFC0C0C0)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // efek lingkaran lembut background
            Positioned(
              top: 90,
              left: 60,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.08),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 100,
                      spreadRadius: 70,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 140,
              right: 80,
              child: Container(
                width: 240,
                height: 240,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.06),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.1),
                      blurRadius: 120,
                      spreadRadius: 80,
                    ),
                  ],
                ),
              ),
            ),

            // konten utama
            Center(
              child: FadeTransition(
                opacity: _fade,
                child: ScaleTransition(
                  scale: _scale,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // logo dengan efek glow
                      Container(
                        height: 230,
                        width: 230,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logofinance.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(height: 30),

                      // shimmer text
                      Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.grey.shade300,
                        child: const Text(
                          'Finance Mate',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.8,
                            color: Color(0xFFC0C0C0),
                            shadows: [
                              Shadow(
                                blurRadius: 10,
                                color: Colors.black45,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // tagline kecil
                      FadeTransition(
                        opacity: _fade,
                        child: const Text(
                          'Smart way to manage your money 💸',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}