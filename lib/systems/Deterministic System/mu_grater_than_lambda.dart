import 'package:Queue_Systems/charts/customer_arrives_chart.dart';
import 'package:Queue_Systems/charts/customer_number_with_initial.dart';
import 'package:Queue_Systems/charts/served_customers_with_initial_chart.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:Queue_Systems/widget/invalid_input.dart';
import 'package:flutter/material.dart';

class MuGraterThanLambda extends StatefulWidget {
  const MuGraterThanLambda({super.key});

  @override
  State<MuGraterThanLambda> createState() => _MuGraterThanLambdaState();
}

class _MuGraterThanLambdaState extends State<MuGraterThanLambda> {
  DeterministicSystemInfo info =
      DeterministicSystemInfo(lambda: 0, mu: 0, time: 0, k: 0, m: 0);
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
            child: correctInput ? Column(
              children: [
                Expanded(flex: 2, child: CustomerArrivesChart(info: info)),
                Expanded(flex: 2, child: ServedCustomersWithInitialChart(info: info)),
                Expanded(flex: 3, child: CustomerNumberWithInitial(info: info))
              ],
            ): InvalidInput()
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                children: [
                  SizedBox(height: 40),
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
                    unicodeSymbol: "t = ",
                    onSubmitted: (value) =>
                        info.time = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: "K = ",
                    onSubmitted: (value) => info.k = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomTextField(
                    unicodeSymbol: "M = ",
                    onSubmitted: (value) => info.m = value.toFractionDouble(),
                  ),
                  SizedBox(height: 15),
                  CustomElevatedButton(
                      onPressed: () => setState(() {
                            correctInput = (info.mu > info.lambda &&
                                info.k! > 0 &&
                                info.m! > 0);
                            ti = getTi(
                                lambda: 1 / info.lambda,
                                mu: 1 / info.mu,
                                m: info.m!,
                                time: info.time);
                          }),
                      text: "Sketch"),
                  SizedBox(height: 40),
                  if (ti == 0 || correctInput == false)
                    SizedBox.shrink()
                  else if (ti != 0)
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
