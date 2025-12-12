import 'package:Queue_Systems/systems/deterministic_system.dart';
import 'package:Queue_Systems/systems/stochastic_system.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ChooseSystem extends StatelessWidget {
  const ChooseSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Choose a system",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeterministicSystem(),
                    ));
              },
              text: "Deterministic System",
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StochasticSystem(),
                      ));
                },
                text: "Stochastic System"),
          ],
        ),
      ),
    );
  }
}
