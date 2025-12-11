import 'package:Queue_Systems/charts/customer_arrives_chart.dart';
import 'package:Queue_Systems/charts/customer_number_chart.dart';
import 'package:Queue_Systems/charts/served_customer_chart.dart';
import 'package:Queue_Systems/function/Deterministic%20System/calculate_n_t.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LambdaGraterThanMuWithoutBulking extends StatefulWidget {
  const LambdaGraterThanMuWithoutBulking({super.key});

  @override
  State<LambdaGraterThanMuWithoutBulking> createState() =>
      _LambdaGraterThanMuWithoutBulkingState();
}

class _LambdaGraterThanMuWithoutBulkingState
    extends State<LambdaGraterThanMuWithoutBulking> {
  double lambda = 0;
  double mu = 0;
  double time = 0;
  bool correctInput = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("D/D/1/K-1 Without Bulking System",style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: correctInput ? CustomerArrivesChart(
                    info: DeterministicSystemInfo(
                        lambda: lambda, mu: mu, time: time, k: 0,m: 0),
                  ): Center(
                    child: Text(
                      "Please enter valid inputs: \u03BB must be grater than \u03BC",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: correctInput ? ServedCustomerChart(
                    info: DeterministicSystemInfo(
                      lambda: lambda,
                      mu: mu,
                      time: time,
                      k: 0,
                      m: 0,
                    ),
                  ): Container(),
                ),
                Expanded(
                  flex: 3,
                  child: correctInput ? CustomerNumberChart(
                    info: DeterministicSystemInfo(
                      lambda: lambda,
                      mu: mu,
                      time: time,
                      k: lambda == 0
                          ? 5
                          : calculateN(lambda: lambda, mu: mu, t: time) + 1,
                      m: 0
                    ),
                  ) :  Container(),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    unicodeSymbol: "\u03BB = ",
                    onSubmitted: (value) => lambda = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: "\u03BC = ",
                    onSubmitted: (value) => mu = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: 't = ',
                    onSubmitted: (value) => time = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomElevatedButton(
                      onPressed: () {
                        setState(() {
                          correctInput = (lambda > 0 &&
                              mu > 0 &&
                              time >= 0 &&
                              lambda > mu);
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
