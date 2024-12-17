import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/controllers/calculator_controller.dart';
import 'widgets/calc_button.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  Home({super.key});

  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Obx(
                    () => Text(
                      controller.currentExpression.value,
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 32),
                    ),
                  ),

                  // TextField(
                  //   readOnly: true,
                  //   keyboardType: const TextInputType.numberWithOptions(),
                  //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  //   textAlign: TextAlign.end,
                  //   controller: controller.textEditingController,
                  //   decoration: InputDecoration.collapsed(
                  //     hintText: '',
                  //     hintTextDirection: TextDirection.rtl,
                  //   ),
                  // ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CalcButton('7'),
                      CalcButton('4'),
                      CalcButton('1'),
                      CalcButton('.'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CalcButton('8'),
                      CalcButton('5'),
                      CalcButton('2'),
                      CalcButton('0'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CalcButton('9'),
                      CalcButton('6'),
                      CalcButton('3'),
                      CalcButton('C'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CalcButton('/'),
                      CalcButton('*'),
                      CalcButton('-'),
                      CalcButton('+'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CalcButton('⌫'),
                      CalcButton('='),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
