import 'package:Queue_Systems/models/system_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomerNumberWithInitial extends StatelessWidget {
  const CustomerNumberWithInitial({super.key, required this.info});

  final DeterministicSystemInfo info;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LineChart(
        LineChartData(
          maxX: info.time,
          maxY: info.m == 0 ? 5 :info.m+1,
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
              spots: info.lambda == 0
                  ? []
                  : customerNumberList(mu: 1/info.mu, lambda: 1/info.lambda, time: info.time, m: info.m),
            ),
          ],
        ),
      ),
    );
  }
}



List<FlSpot> customerNumberList({required double mu, required double lambda, required double time, required double m}) {
  List<FlSpot> flSpots = [];
  List<Map<String, dynamic>> spots = finalSpots(mu: mu, lambda: lambda, time: time, m: m,);

  for (var spot in spots) {
    flSpots.add(FlSpot(spot['xSpot'], spot['ySpot']));
  }

  return flSpots;
}

List<double> getXSpots({required double lambda, required double mu, required double time, required double m}) {
  final Set<double> xSpots = {};
  List<double> arrivesXs = getXSpotsOfArrives(lamda: lambda, time: time);
  List<double> serviceXs = getXSpotsOfService(mu: mu, lambda: lambda, time: time, m: m);

  for (var arrival in arrivesXs) {
    if (arrival <= time) {
      xSpots.add(arrival);
    }
  }

  for (var service in serviceXs) {
    if (service <= time) {
      xSpots.add(service);
    }
  }
  final result = xSpots.toList()..sort();
  return result;
}

List<double> getXSpotsOfService({required double mu, required double lambda, required double time, required double m}) {
  List<double> arrivesXs = getXSpotsOfArrives(lamda: lambda, time: time);
  List<double> xs = [];
  for (double i = 1; i <= m; i++) {
    xs.add(i * mu);
  }
  int counter = 0;
  for (double i = 1; i <= time; i++) {
    if (arrivesXs[counter] < (i + m) * mu) {
      if ((i + m) * mu <= time) {
        xs.add((i + m) * mu);
      }
      counter++;
    }
    if (counter >= arrivesXs.length) {
      break;
    }
  }

  return xs;
}

List<double> getXSpotsOfArrives({required double lamda, required double time}) {
  List<double> xs = [];
  for (int i = 1; i <= time / lamda; i++) {
    xs.add(lamda * i);
  }

  return xs;
}

List<Map<String, dynamic>> finalSpots({required double mu, required double lambda, required double time, required double m}) {
  List<double> xSpotsOfService = getXSpotsOfService(mu: mu, lambda: lambda, time: time, m: m);
  List<double> xSpotsOfArrives = getXSpotsOfArrives(lamda: lambda, time: time);
  List<double> xSpots = getXSpots(lambda: lambda, mu: mu, time: time, m: m);

  List<Map<String, dynamic>> spots = [
    {'isArrival': false, 'isServed': false, 'xSpot': 0.0, 'ySpot': m}
  ];
  double ySpot = m;
  bool isArrival;
  bool isServed;
  for(int i = 0; i < xSpots.length; i++) {
    double xSpot = xSpots[i];
    if (xSpotsOfArrives.contains(xSpot)) {
      isArrival = true;
    } else {
      isArrival = false;
    }
    if (xSpotsOfService.contains(xSpot)) {
      isServed = true;
    } else {
      isServed = false;
    }
    if (isArrival) ySpot++;
    if (isServed) ySpot--;
    spots.add({
      'isArrival': isArrival,
      'isServed': isServed,
      'xSpot': xSpot,
      'ySpot': ySpot
    });
  }
  spots.add({'isArrival': false, 'isServed': false, 'xSpot': time, 'ySpot': ySpot});
  return spots;
}

double getTi({required double lambda, required double mu, required double m,required double time}) {
  List<Map<String, dynamic>> spots= finalSpots(mu: mu, lambda: lambda, time: time, m: m);
  for (var spot in spots) {
    if (spot['ySpot'] == 0) {
      return spot['xSpot'];
    }
  }
  return -1;
}
