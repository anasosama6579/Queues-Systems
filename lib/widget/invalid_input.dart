import 'package:flutter/material.dart';

class InvalidInput extends StatelessWidget {
  const InvalidInput({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Please enter valid inputs",
        style:
        TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }
}
