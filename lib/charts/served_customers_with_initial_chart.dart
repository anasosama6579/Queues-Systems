import 'package:Queue_Systems/models/system_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ServedCustomersWithInitialChart extends StatelessWidget {
  const ServedCustomersWithInitialChart({super.key, required this.info});

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
              spots: _servedArrowSpots(
                  lambda: 1 / info.lambda,
                  mu: 1 / info.mu,
                  time: info.time,
                  m: info.m,),
            ),
          ],
        ),
      ),
    );
  }
}

List<FlSpot> _servedArrowSpots({required double mu, required double lambda, required double time, required double m}) {
  final arrows = <FlSpot>[];
  List<double> xs = getXSpots(
      mu: mu,
      lamda: lambda,
      time: time,
      m: m,
      arrivesXs: _arrivesArrowSpots(lamda: lambda, time: time));

  for (final x in xs) {
    if (x<=time) {
      arrows.add(FlSpot(x, 3));
      arrows.add(FlSpot(x, 1));
      arrows.add(FlSpot(double.nan, double.nan));
    }
  }
  return arrows;
}

List<double> getXSpots({required double mu, required double lamda, required double time, required double m, required List<double> arrivesXs}) {
  List<double> xs = [];
  for (double i = 0; i <= m; i++) {
    xs.add(i * mu);
  }
  int counter = 0;
  for (double i = 1; i <= time; i++) {
    if (arrivesXs[counter] < (i + m) * mu) {
      if ((i + m) * mu <= time) {
        xs.add((i + m-mu) *mu);
      }
      counter++;
    }
    if (counter >= arrivesXs.length) {
      break;
    }
  }

  return xs;
}

List<double> _arrivesArrowSpots({required double lamda, required double time}) {
  List<double> xs = [];
  for (int i = 1; i < time / lamda; i++) {
    xs.add(lamda * i);
  }

  return xs;
}
