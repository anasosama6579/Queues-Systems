import 'package:Queue_Systems/charts/customer_arrives_chart.dart';
import 'package:Queue_Systems/charts/new_customer_number.dart';
import 'package:Queue_Systems/charts/new_served_customers_chart.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:flutter/material.dart';


class MuGraterThanLambda extends StatefulWidget {
  const MuGraterThanLambda({super.key});

  @override
  State<MuGraterThanLambda> createState() => _MuGraterThanLambdaState();
}

class _MuGraterThanLambdaState extends State<MuGraterThanLambda> {
  double lambda = 0;
  double mu = 0;
  double time = 0;
  double k = 0;
  double m = 0;
  double ti = 0;
  bool correctInput = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "μ > λ",
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
                            m: m,
                          ),
                        )
                      : Center(
                          child: Text(
                            "Please enter valid inputs: \u03BC must be grater than \u03BB",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                        ),
                ),
                Expanded(
                  flex: 2,
                  child: correctInput
                      ? NewServedCustomersChart(
                          info: DeterministicSystemInfo(
                            lambda: lambda,
                            mu: mu,
                            time: time,
                            k: k,
                            m: m,
                          ),
                        )
                      : Container(),
                ),
                Expanded(
                  flex: 3,
                  child: correctInput
                      ? NewCustomerNumberChart(
                          info: DeterministicSystemInfo(
                            lambda: lambda,
                            mu: mu,
                            time: time,
                            k: k,
                            m: m,
                          ),
                        )
                      : Container(),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
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
                    unicodeSymbol: "t = ",
                    onSubmitted: (value) => time = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: "K = ",
                    onSubmitted: (value) => k = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: "M = ",
                    onSubmitted: (value) => m = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomElevatedButton(
                      onPressed: () => setState(() {
                            correctInput = (mu > lambda && k > 0 && m > 0);
                            ti = getTi(
                                lambda: 1 / lambda,
                                mu: 1 / mu,
                                m: m,
                                time: time);
                          }),
                      text: "Sketch"),
                  SizedBox(height: 40),
                  if (ti == 0) SizedBox.shrink(),
                  if (ti != 0)
                    Text(
                      ti == -1 ? "Increase your time range" : "ti = $ti",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
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
