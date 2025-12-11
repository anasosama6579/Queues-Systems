import 'package:Queue_Systems/function/Stochastic%20System/with%20C/calculate_system_parameters_in_infinite_storage_with_c.dart';
import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';
import 'package:Queue_Systems/widget/custom_container.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:Queue_Systems/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class MByMByC extends StatefulWidget {
  const MByMByC({super.key});

  @override
  State<MByMByC> createState() => _MByMByCState();
}

class _MByMByCState extends State<MByMByC> {

  late StochasticSystemInfo info = StochasticSystemInfo(lambda: 0, mu: 0, c: 0);
  bool isCalculated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "M / M / C",
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
                unicodeSymbol: "C = ",
                onSubmitted: (value) {
                  info.c = value.toFractionDouble().toInt();
                },
              ),
              SizedBox(height: 35),
              isCalculated
                  ? Column(
                children: [
                  CustomContainer(
                      data: calculateExpectedNumberOfCustomerInTheSystemWithC(
                          info),
                      suffix: "L"),
                  SizedBox(height: 10),
                  CustomContainer(
                      data: calculateExpectedNumberOfCustomerInTheQueueWithC(
                          info),
                      suffix: "Lq"),
                  SizedBox(height: 10),
                  CustomContainer(
                      data: calculateExpectedWaitingTimeInTheSystemWithC(
                          info),
                      suffix: "W"),
                  SizedBox(height: 10),
                  CustomContainer(
                      data: calculateExpectedWaitingTimeInTheQueueWithC(
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
