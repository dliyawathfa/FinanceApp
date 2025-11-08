import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const burgundy = Color(0xFF800020);
    const silver = Color(0xFFC0C0C0);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: burgundy,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView( // supaya semua widget terlihat
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile image
            const CircleAvatar(
              radius: 55,
              backgroundColor: silver,
              backgroundImage: AssetImage('assets/profile.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Dliya Wathfa Khoiriyah',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: burgundy,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Finance Enthusiast 💰',
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Divider(color: silver.withOpacity(0.5)),
            const SizedBox(height: 16),

            // Info section
            ProfileTile(
              icon: Icons.email_rounded,
              title: 'Email',
              subtitle: 'dliyawathfa@gmail.com',
            ),
            ProfileTile(
              icon: Icons.phone_rounded,
              title: 'Phone',
              subtitle: '+62 812-3456-7890',
            ),
            ProfileTile(
              icon: Icons.location_on_rounded,
              title: 'Location',
              subtitle: 'Malang, Indonesia',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    const burgundy = Color(0xFF800020);
    const silver = Color(0xFFC0C0C0);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: silver.withOpacity(0.15),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(icon, color: burgundy, size: 26),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
