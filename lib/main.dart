import 'package:flutter/material.dart';
import 'package:tune/systems/choose_system.dart';

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
