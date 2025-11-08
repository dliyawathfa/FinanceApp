import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  static const burgundy = Color(0xFF800020);
  static const silver = Color(0xFFC0C0C0);

  String selectedFilter = 'Month';

  final Map<String, List<double>> dataValues = {
    'Day': [2.5, 3, 3.8, 4, 3.2, 4.6, 5],
    'Week': [3.5, 4.2, 4.8, 5],
    'Month': [3, 3.8, 4.5, 4.2, 5, 4.7],
    'Year': [3.5, 4, 4.6, 5],
  };

  final Map<String, List<String>> labels = {
    'Day': ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    'Week': ['W1', 'W2', 'W3', 'W4'],
    'Month': ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
    'Year': ['2021', '2022', '2023', '2024'],
  };

  List<FlSpot> get spots {
    final values = dataValues[selectedFilter]!;
    return List.generate(values.length, (i) => FlSpot(i.toDouble(), values[i]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: const BoxDecoration(
                color: burgundy,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Back dan profile
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back,
                            color: silver, size: 26),
                      ),
                      const Text(
                        'Reports',
                        style: TextStyle(
                          color: silver,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(Icons.menu, color: silver),
                    ],
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    'Total Balance',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    NumberFormat.currency(
                      locale: 'id_ID',
                      symbol: 'Rp',
                      decimalDigits: 0,
                    ).format(24165000),
                    style: const TextStyle(
                      color: silver,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Filter dan Grafik
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFilterChip('Day'),
                      _buildFilterChip('Week'),
                      _buildFilterChip('Month'),
                      _buildFilterChip('Year'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 250,
                    child: LineChart(
                      LineChartData(
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 30,
                              getTitlesWidget: (value, meta) {
                                int index = value.toInt();
                                final labelList = labels[selectedFilter]!;
                                if (index >= 0 && index < labelList.length) {
                                  return Text(
                                    labelList[index],
                                    style: const TextStyle(
                                      color: burgundy,
                                      fontSize: 12,
                                    ),
                                  );
                                }
                                return const SizedBox.shrink();
                              },
                              interval: 1, // tampil tiap 1 data
                            ),
                          ),
                        ),
                        lineBarsData: [
                          LineChartBarData(
                            isCurved: true,
                            color: burgundy,
                            barWidth: 4,
                            isStrokeCapRound: true,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(
                              show: true,
                              color: burgundy.withOpacity(0.15),
                            ),
                            spots: spots,
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

  Widget _buildFilterChip(String label) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        decoration: BoxDecoration(
          color: selectedFilter == label
              ? burgundy.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selectedFilter == label ? burgundy : silver,
            width: 1.3,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selectedFilter == label ? burgundy : Colors.black54,
            fontWeight:
                selectedFilter == label ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
