import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesChart extends StatelessWidget {
  const SalesChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[850],
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(toY: 8, color: Colors.tealAccent)],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(toY: 10, color: Colors.tealAccent)],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(toY: 14, color: Colors.tealAccent)],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(toY: 15, color: Colors.tealAccent)],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [BarChartRodData(toY: 13, color: Colors.tealAccent)],
                ),
              ],
              borderData: FlBorderData(show: false),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return Text('Q${value.toInt() + 1}',
                          style: const TextStyle(color: Colors.white70));
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return Text('${value.toInt()}K',
                          style: const TextStyle(color: Colors.white70));
                    },
                  ),
                ),
              ),
              gridData: FlGridData(show: true),
            ),
            swapAnimationDuration: const Duration(milliseconds: 250),
          ),
        ),
      );
    } catch (e) {
      return Center(
        child: Text(
          "Error loading chart",
          style: TextStyle(color: Colors.redAccent),
        ),
      );
    }
  }
}
