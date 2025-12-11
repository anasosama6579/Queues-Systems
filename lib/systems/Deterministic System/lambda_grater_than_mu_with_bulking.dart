import 'package:Queue_Systems/charts/bulking_customer_number_chart.dart';
import 'package:Queue_Systems/charts/customer_arrives_chart.dart';
import 'package:Queue_Systems/charts/served_customer_chart.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LambdaGraterThanMuWithBulking extends StatefulWidget {
  const LambdaGraterThanMuWithBulking({super.key});

  @override
  State<LambdaGraterThanMuWithBulking> createState() =>
      _LambdaGraterThanMuWithBulkingState();
}

class _LambdaGraterThanMuWithBulkingState
    extends State<LambdaGraterThanMuWithBulking> {
  double lambda = 0;
  double mu = 0;
  double time = 0;
  double k = 0;
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
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: correctInput
                      ? CustomerArrivesChart(
                          info: DeterministicSystemInfo(
                            lambda: lambda,
                            mu: mu,
                            time: time,
                            k: k,
                            m: 0,
                          ),
                        )
                      : Center(
                          child: Text(
                            "Please enter valid inputs: \u03BB must be grater than \u03BC",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
                Expanded(
                  flex: 2,
                  child: correctInput
                      ? ServedCustomerChart(
                          info: DeterministicSystemInfo(
                              lambda: lambda, mu: mu, time: time, k: k, m: 0),
                        )
                      : Container(),
                ),
                Expanded(
                  flex: 3,
                  child: correctInput
                      ? BulkingCustomerNumberChart(
                          info: DeterministicSystemInfo(
                              lambda: lambda, mu: mu, time: time, k: k, m: 0),
                        )
                      : Container(),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
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
                          lambda = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      unicodeSymbol: "\u03BC = ",
                      onSubmitted: (value) => mu = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      unicodeSymbol: "t = ",
                      onSubmitted: (value) => time = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      unicodeSymbol: "K = ",
                      onSubmitted: (value) => k = value.toFractionDouble()),
                  SizedBox(
                    height: 15,
                  ),
                  CustomElevatedButton(
                    onPressed: () => setState(() {
                      correctInput = (lambda > 0 &&
                          mu > 0 &&
                          time >= 0 &&
                          k > 0 &&
                          lambda > mu);
                      bulkingTime = findTheFirstBulkedCustomerTime(
                        lambda: 1 / lambda,
                        mu: 1 / mu,
                        k: k,
                        time: time,
                      );
                    }),
                    text: "Sketch",
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  if (bulkingTime == 0)
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
