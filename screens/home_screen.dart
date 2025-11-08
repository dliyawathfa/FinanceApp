import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';
import '../widgets/atm_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Color burgundy = const Color(0xFF800020);
  final Color silver = const Color(0xFFC0C0C0);
  int selectedCategoryIndex = 0;

  final transactions = [
    TransactionModel('Invision', -68030, 'Work', '13 Nov, 8:34 AM'),
    TransactionModel('McDonald’s', -21550, 'Food', '9 Nov, 3:52 PM'),
    TransactionModel('Medical Center', -385020, 'Health', '7 Nov, 3:34 PM'),
    TransactionModel('Traveloka', -120000, 'Travel', '5 Nov, 10:20 AM'),
    TransactionModel('Starbucks', -80990, 'Food', '4 Nov, 9:12 AM'),
  ];

  final categories = [
    {'icon': Icons.home_rounded, 'label': 'All'},
    {'icon': Icons.favorite_rounded, 'label': 'Health'},
    {'icon': Icons.flight_takeoff_rounded, 'label': 'Travel'},
    {'icon': Icons.fastfood_rounded, 'label': 'Food'},
    {'icon': Icons.work_rounded, 'label': 'Work'},
  ];

  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final filteredTransactions = selectedCategoryIndex == 0
        ? transactions
        : transactions
            .where((tx) =>
                tx.category == categories[selectedCategoryIndex]['label'])
            .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cards',
          style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black87),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cards section
            SizedBox(
              height: 180,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    AtmCard(
                      bankName: 'Debit Card',
                      cardNumber: '**** 0610',
                      balance: 'Rp7.658.000',
                      color1: Color(0xFF800020),
                      color2: Color(0xFFC0C0C0),
                    ),
                    SizedBox(width: 16),
                    AtmCard(
                      bankName: 'Credit Card',
                      cardNumber: '**** 7712',
                      balance: 'Rp3.250.000',
                      color1: Color(0xFFC0C0C0),
                      color2: Color(0xFF800020),
                    ),
                    SizedBox(width: 16),
                    AtmCard(
                      bankName: 'Savings Card',
                      cardNumber: '**** 4421',
                      balance: 'Rp5.125.000',
                      color1: Color(0xFF800020),
                      color2: Color(0xFFC0C0C0),
                    ),
                    SizedBox(width: 16),
                    AtmCard(
                      bankName: 'Business Card',
                      cardNumber: '**** 9901',
                      balance: 'Rp12.840.000',
                      color1: Color(0xFFC0C0C0),
                      color2: Color(0xFF800020),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Popular operations',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            // Categories
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategoryIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.only(right: 12),
                      width: 80,
                      decoration: BoxDecoration(
                        color: isSelected ? burgundy : silver,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categories[index]['icon'] as IconData,
                            color: isSelected ? silver : burgundy,
                            size: 28,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            categories[index]['label'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              color: isSelected ? silver : burgundy,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Transactions
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [burgundy, const Color(0xFF4B0018)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ...filteredTransactions.map(
                    (tx) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  tx.category == 'Food'
                                      ? Icons.fastfood_rounded
                                      : tx.category == 'Travel'
                                          ? Icons.flight_takeoff_rounded
                                          : tx.category == 'Health'
                                              ? Icons.favorite_rounded
                                              : tx.category == 'Work'
                                                  ? Icons.work_rounded
                                                  : Icons.home_rounded,
                                  color: burgundy,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    tx.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    tx.date,
                                    style: const TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            formatCurrency(tx.amount),
                            style: TextStyle(
                              color: tx.amount < 0
                                  ? Colors.red[300]
                                  : Colors.greenAccent[400],
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
