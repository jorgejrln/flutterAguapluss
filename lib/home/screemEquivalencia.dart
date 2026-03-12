import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:proyecto_aguapluss/recursos/colores.dart';

class equivalenciaScreen extends StatefulWidget {
  const equivalenciaScreen({super.key});

  @override
  State<equivalenciaScreen> createState() => _equivalenciaScreenState();
}

class _equivalenciaScreenState extends State<equivalenciaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colores.primary,
     
      body: Center(
        child: Container(
          height: 400,
          width: 700,
          padding: const EdgeInsets.all(20),
          child: BarChart(
            BarChartData(
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: true),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const dias = [
                        "L",
                        "M",
                        "Mi",
                        "J",
                        "V",
                        "S",
                        "D"
                      ];

                      return Text(
                        dias[value.toInt()],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      );
                    },
                  ),
                ),
              
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [BarChartRodData(toY: 2500, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [BarChartRodData(toY: 3200, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [BarChartRodData(toY: 2800, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [BarChartRodData(toY: 3500, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [BarChartRodData(toY: 4000, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [BarChartRodData(toY: 3000, color: Colors.blue)],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [BarChartRodData(toY: 2200, color: Colors.blue)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}