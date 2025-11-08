import 'package:flutter/material.dart';

class AtmCard extends StatefulWidget {
  final String bankName;
  final String cardNumber;
  final String balance;
  final Color color1;
  final Color color2;

  const AtmCard({
    super.key,
    required this.bankName,
    required this.cardNumber,
    required this.balance,
    required this.color1,
    required this.color2,
  });

  @override
  State<AtmCard> createState() => _AtmCardState();
}

class _AtmCardState extends State<AtmCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.identity()
        ..scale(_isHovered ? 1.05 : 1.0)
        ..translate(_isHovered ? 0.0 : 0.0),
      width: 300,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [widget.color1, widget.color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: widget.color2.withOpacity(0.4),
            blurRadius: _isHovered ? 12 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.bankName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              widget.balance,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.cardNumber,
              style: const TextStyle(color: Color(0xFFC0C0C0)),
            ),
          ],
        ),
      ),
    );
  }
}
