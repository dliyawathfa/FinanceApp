import 'package:flutter/material.dart';

class GridMenuItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const GridMenuItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    const burgundy = Color(0xFF800020);
    const silver = Color(0xFFC0C0C0);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: burgundy,  
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: burgundy.withOpacity(0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {}, 
        splashColor: silver.withOpacity(0.2),
        highlightColor: silver.withOpacity(0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: silver), 
            const SizedBox(height: 8),
            Text(
              label,
              style: const TextStyle(
                color: silver, 
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
