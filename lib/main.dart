import 'dart:math';

import 'package:Queue_Systems/systems/choose_system.dart';
import 'package:flutter/material.dart';

void main() => runApp(const QueueApp());

class QueueApp extends StatelessWidget {
  const QueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Queue App',
      debugShowCheckedModeBanner: false,
      home: ChooseSystem()
    );
  }
}



extension SignificantDigitsExtension on double {
  double toSignificantDigits(int digits) {
    if (this == 0) return 0;

    final double scale =
    pow(10, digits - 1 - (log(abs()) / ln10).floor()).toDouble();

    return (this * scale).round() / scale;
  }
}

extension StringToDouble on String {
  double toFractionDouble() {
    if (contains('/')) {
      final parts = split('/');
      if (parts.length == 2) {
        final num = double.tryParse(parts[0]) ?? 0;
        final den = double.tryParse(parts[1]) ?? 1;
        return num / den;
      }
    }
    return double.tryParse(this) ?? 0;
  }
}