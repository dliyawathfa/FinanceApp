import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
        locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);
    return formatter.format(amount);
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Work':
        return Icons.work_rounded;
      case 'Food':
        return Icons.fastfood_rounded;
      case 'Health':
        return Icons.favorite_rounded;
      case 'Travel':
        return Icons.flight_takeoff_rounded;
      default:
        return Icons.attach_money_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    const burgundy = Color(0xFF800020);
    const silver = Color(0xFFC0C0C0);
    final isExpense = transaction.amount < 0;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: burgundy,
          child: Icon(
            _getCategoryIcon(transaction.category),
            color: silver,
          ),
        ),
        title: Text(
          transaction.title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        subtitle: Text(transaction.date,
            style: const TextStyle(color: Colors.black54, fontSize: 13)),
        trailing: Text(
          formatCurrency(transaction.amount),
          style: TextStyle(
            color: isExpense ? Colors.red[300] : Colors.green[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
