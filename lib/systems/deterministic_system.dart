import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'Deterministic System/lambda_grater_than_mu_with_bulking.dart';
import 'Deterministic System/lambda_grater_than_mu_without_bulking.dart';
import 'Deterministic System/mu_grater_than_lambda.dart';

class DeterministicSystem extends StatelessWidget {
  const DeterministicSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Choose a D/D/1/K-1 system",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LambdaGraterThanMuWithoutBulking(),
                  ),
                );
              },
              text: "λ > μ Without Bulking",
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LambdaGraterThanMuWithBulking(),
                    ),
                  );
                },
                text: "λ > μ With Bulking"),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MuGraterThanLambda(),
                    ),
                  );
                },
                text: "μ > λ "),
          ],
        ),
      ),
    );
  }
}
