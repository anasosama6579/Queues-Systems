import 'package:Queue_Systems/systems/Stochastic%20System/m_by_m_by_c.dart';
import 'package:Queue_Systems/systems/Stochastic%20System/m_by_m_by_c_by_k.dart';
import 'package:Queue_Systems/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'Stochastic System/m_by_m_by_1.dart';
import 'Stochastic System/m_by_m_by_1_by_k.dart';

class StochasticSystem extends StatelessWidget {
  const StochasticSystem({super.key});

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
              "Choose a Stochastic system",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MByMBy1(),
                  )),
              text: "M / M / 1",
            ),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MByMBy1ByK(),
                    )),
                text: "M / M / 1 / K"),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MByMByC(),
                )), text: "M / M / C "),
            SizedBox(
              height: 20,
            ),
            CustomElevatedButton(onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MByMByCByK())), text: "M / M / C / K"),
          ],
        ),
      ),
    );
  }
}
