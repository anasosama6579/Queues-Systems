import 'package:Queue_Systems/charts/bulking_customer_number_chart.dart';
import 'package:Queue_Systems/charts/customer_arrives_chart.dart';
import 'package:Queue_Systems/charts/served_customer_chart.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:Queue_Systems/widget/invalid_input.dart';
import 'package:flutter/material.dart';

class LambdaGraterThanMuWithBulking extends StatefulWidget {
  const LambdaGraterThanMuWithBulking({super.key});

  @override
  State<LambdaGraterThanMuWithBulking> createState() =>
      _LambdaGraterThanMuWithBulkingState();
}

class _LambdaGraterThanMuWithBulkingState
    extends State<LambdaGraterThanMuWithBulking> {
  DeterministicSystemInfo info =
      DeterministicSystemInfo(lambda: 0, mu: 0, time: 0, k: 0, m: 0);
  double bulkingTime = 0;
  bool correctInput = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "D/D/1/K-1 With Bulking System ",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child:correctInput? Column(
              children: [
                Expanded(flex: 2, child: CustomerArrivesChart(info: info)),
                Expanded(flex: 2, child: ServedCustomerChart(info: info)),
                Expanded(flex: 3, child: BulkingCustomerNumberChart(info: info)),
                SizedBox(
                  height: 20,
                ),
              ],
            ): InvalidInput()
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  CustomTextField(
                      unicodeSymbol: "\u03BB = ",
                      onSubmitted: (value) =>
                          info.lambda = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      unicodeSymbol: "\u03BC = ",
                      onSubmitted: (value) =>
                          info.mu = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      unicodeSymbol: "t = ",
                      onSubmitted: (value) =>
                          info.time = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      unicodeSymbol: "K = ",
                      onSubmitted: (value) =>
                          info.k = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomElevatedButton(
                    onPressed: () => setState(() {
                      correctInput = (info.lambda > 0 &&
                          info.mu > 0 &&
                          info.time >= 0 &&
                          info.k! > 0 &&
                          info.lambda > info.mu);
                      bulkingTime = findTheFirstBulkedCustomerTime(
                        lambda: 1 / info.lambda,
                        mu: 1 / info.mu,
                        k: info.k!,
                        time: info.time,
                      );
                    }),
                    text: "Sketch",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  if (bulkingTime == 0 || correctInput == false)
                    SizedBox.shrink()
                  else if (bulkingTime == -1)
                    Text(
                      "No bulking occurs in the given time.",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    )
                  else
                    Text(
                      "ti = ${bulkingTime.toStringAsFixed(0)}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
