import 'package:Queue_Systems/models/system_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ServedCustomerChart extends StatelessWidget {
  const ServedCustomerChart({super.key, required this.info});

  final DeterministicSystemInfo info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChart(
        LineChartData(
          maxX: info.time,
          maxY: 4,
          minX: 0,
          minY: 0,
          borderData: FlBorderData(border: Border.all(color: Colors.black)),
          gridData: FlGridData(
            show: true,
            getDrawingHorizontalLine: (value) =>
                FlLine(color: Colors.grey[400], strokeWidth: 0.5),
            getDrawingVerticalLine: (value) =>
                FlLine(color: Colors.grey[400], strokeWidth: 0.5),
          ),
          lineBarsData: [
            LineChartBarData(
                color: Colors.red,
                barWidth: 2,
                spots: _servedArrowSpots(lamda: 1 / info.lambda, mu: 1 / info.mu, time: info.time)),
          ],
        ),
      ),
    );
  }
}

List<FlSpot> _servedArrowSpots(
    {required double mu, required double lamda, required double time}) {
  final arrows = <FlSpot>[];
  List<double> xs = [];
  for (int i = 0; i <= (time - lamda) / mu; i++) {
    xs.add(lamda + mu * i);
  }
  for (final x in xs) {
    arrows.add(FlSpot(x, 3));
    arrows.add(FlSpot(x, 1));
    arrows.add(FlSpot(double.nan, double.nan));
  }
  return arrows;
}
