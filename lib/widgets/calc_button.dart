import 'package:flutter/material.dart';
import 'package:calculator/controllers/calculator_controller.dart';
import 'package:get/get.dart';

class CalcButton extends StatelessWidget {
  final String symbol;
  final CalculatorController controller = Get.find<CalculatorController>();

  CalcButton(this.symbol, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: ElevatedButton(
        onPressed: () => controller.onButtonPressed(symbol),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(20),
        ),
        child: Text(
          symbol,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
