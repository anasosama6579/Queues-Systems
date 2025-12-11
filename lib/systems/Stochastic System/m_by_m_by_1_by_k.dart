import 'package:Queue_Systems/function/Stochastic%20System/Without%20C/calculate_system_parameters_with_finite_storage.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_container.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:flutter/material.dart';


class MByMBy1ByK extends StatefulWidget {
  const MByMBy1ByK({super.key});

  @override
  State<MByMBy1ByK> createState() => _MByMBy1ByKState();
}

class _MByMBy1ByKState extends State<MByMBy1ByK> {

  late StochasticSystemInfo info = StochasticSystemInfo(lambda: 0, mu: 0, K: 0);
  bool isCalculated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "M / M / 1 / K",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            children: [
              CustomTextField(
                unicodeSymbol: "\u03BB = ",
                onSubmitted: (value) {
                  info.lambda = value.toFractionDouble();
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                unicodeSymbol: "\u03BC = ",
                onSubmitted: (value) {
                  info.mu = value.toFractionDouble();
                },
              ),
              SizedBox(height: 10),
              CustomTextField(
                unicodeSymbol: "K = ",
                onSubmitted: (value) {
                  info.K = value.toFractionDouble();
                },
              ),
              SizedBox(height: 35),
              isCalculated
                  ? Column(
                children: [
                  CustomContainer(
                      data: calculateExpectedNumberOfCustomerInTheSystemWithFiniteStorage(
                          info),
                      suffix: "L"),
                  SizedBox(height: 10),
                  CustomContainer(
                      data: calculateExpectedNumberOfCustomerInTheQueueWithFiniteStorage(
                          info),
                      suffix: "Lq"),
                  SizedBox(height: 10),
                  CustomContainer(
                      data: calculateExpectedWaitingTimeInTheSystemWithFiniteStorage(
                          info),
                      suffix: "W"),
                  SizedBox(height: 10),
                  CustomContainer(
                      data: calculateExpectedWaitingTimeInTheQueueWithFiniteStorage(
                          info),
                      suffix: "Wq"),
                  SizedBox(height: 35),
                ],
              )
                  : SizedBox.shrink(),

              CustomElevatedButton(
                  onPressed: () {
                    if (info.mu != 0 && info.lambda != 0) {
                      setState(() {
                        isCalculated = true;
                      });
                    }
                  },
                  text: "Calculate")
            ],
          ),
        ),
      ),
    );
  }
}
