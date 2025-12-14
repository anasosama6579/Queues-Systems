import 'package:Queue_Systems/charts/customer_arrives_chart.dart';
import 'package:Queue_Systems/charts/customer_number_chart.dart';
import 'package:Queue_Systems/charts/served_customer_chart.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:Queue_Systems/widget/invalid_input.dart';
import 'package:flutter/material.dart';

class LambdaGraterThanMuWithoutBulking extends StatefulWidget {
  const LambdaGraterThanMuWithoutBulking({super.key});

  @override
  State<LambdaGraterThanMuWithoutBulking> createState() =>
      _LambdaGraterThanMuWithoutBulkingState();
}

class _LambdaGraterThanMuWithoutBulkingState
    extends State<LambdaGraterThanMuWithoutBulking> {
  DeterministicSystemInfo info =
      DeterministicSystemInfo(lambda: 0, mu: 0, time: 0, k: 0, m: 0);
  bool correctInput = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "D/D/1/K-1 Without Bulking System",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: correctInput
                ? Column(
                    children: [
                      Expanded(flex: 2, child: CustomerArrivesChart(info: info)),
                      Expanded(flex: 2, child: ServedCustomerChart(info: info)),
                      Expanded(flex: 3, child: CustomerNumberChart(info: info)),
                      SizedBox(height: 15),
                    ],
                  )
                : InvalidInput(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    unicodeSymbol: "\u03BB = ",
                    onSubmitted: (value) =>
                        info.lambda = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: "\u03BC = ",
                    onSubmitted: (value) => info.mu = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: 't = ',
                    onSubmitted: (value) =>
                        info.time = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          correctInput = (info.lambda > 0 &&
                              info.mu > 0 &&
                              info.time >= 0 &&
                              info.lambda > info.mu);
                        });
                      },
                      text: "Sketch")
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
