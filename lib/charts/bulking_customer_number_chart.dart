import 'package:Queue_Systems/models/system_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BulkingCustomerNumberChart extends StatelessWidget {
  const BulkingCustomerNumberChart({super.key, required this.info});

  final DeterministicSystemInfo info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChart(
        LineChartData(
          maxX: info.time,
          maxY: info.k == 0 ? 5 : info.k,
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
              isStepLineChart: true,
              lineChartStepData: LineChartStepData(stepDirection: 0),
              spots: customerNumberList(
                spots: info.lambda == 0
                    ? []
                    : spots(
                        lambda: 1 / info.lambda,
                        mu: 1 / info.mu,
                        time: info.time,
                        maxCustomers: info.k! - 1,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<FlSpot> customerNumberList({required List<Map<String, dynamic>> spots}) {
  List<FlSpot> flSpots = [];
  for (var spot in spots) {
    flSpots.add(FlSpot(spot['xSpot'], spot['ySpot']));
  }
  return flSpots;
}

List<double> getXSpots({required double lambda, required double mu, required double time}) {
  final Set<double> xSpots = {};
  for (int i = 1; i <= time / lambda; i++) {
    final double arrival = lambda * i;
    final double service = lambda + mu * i;

    if (arrival < time) xSpots.add(arrival);
    if (service < time) xSpots.add(service);
  }
  final result = xSpots.toList()..sort();
  return result;
}

List<Map<String, dynamic>> spots(
    {required double lambda,
    required double mu,
    required double time,
    required double maxCustomers}) {
  List<double> xSpots = getXSpots(lambda: lambda, mu: mu, time: time);
  List<Map<String, dynamic>> spotsList = [
    {'isArrival': false, 'isServed': false, 'xSpot': 0.0, 'ySpot': 0.0}
  ];

  bool isArrival;
  bool isServed;
  double ySpot = 0;

  for (var xSpot in xSpots) {
    if (xSpot % lambda == 0) {
      isArrival = true;
      ySpot++;
    } else {
      isArrival = false;
    }

    if ((xSpot - lambda) % mu == 0 && (xSpot - lambda) / mu != 0) {
      isServed = true;
      ySpot--;
    } else {
      isServed = false;
    }

    if (ySpot < 0) ySpot = 0;
    if (ySpot > maxCustomers) ySpot = maxCustomers;

    spotsList.add({
      'isArrival': isArrival,
      'isServed': isServed,
      'xSpot': xSpot,
      'ySpot': ySpot,
    });
  }
  spotsList.add({
    'isArrival': false,
    'isServed': false,
    'xSpot': time,
    'ySpot': ySpot,
  });
  return spotsList;
}

double findTheFirstBulkedCustomerTime({
  required double lambda,
  required double mu,
  required double k,
  required double time,
}) {
  List<double> xSpots = getXSpots(lambda: lambda, mu: mu, time: time);
  int ySpot = 0;
  for (var xSpot in xSpots) {
    if (xSpot % lambda == 0) ySpot++;
    if ((xSpot - lambda) % mu == 0 && (xSpot - lambda) / mu != 0) ySpot--;
    if (ySpot > k - 1) return xSpot;
  }
  return -1;
}
