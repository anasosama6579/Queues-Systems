import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:tune/models/system_info.dart';

class CustomerArrivesChart extends StatelessWidget {
  const CustomerArrivesChart({super.key, required this.info});

  final SystemInfo info;

  @override
  Widget build(BuildContext context) {
    return LineChart(
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
          lineBarsData: [LineChartBarData(color: Colors.red,barWidth: 2,spots: _arrivesArrowSpots(lamda: 1/info.lambda, time: info.time))]
        ),
      );
  }
}

List<FlSpot> _arrivesArrowSpots({required double lamda,required double time}) {
  final arrows = <FlSpot>[];
  List<double> xs = [];
  for (int i = 1; i <= time/lamda; i++) {
    xs.add(lamda * i);
  }
  for (final x in xs) {
    arrows.add(FlSpot(x, 3));
    arrows.add(FlSpot(x, 1));
    arrows.add(FlSpot(double.nan, double.nan));
  }
  return arrows;
}