import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  RxString currentExpression = ''.obs;
  final String error = 'Error';

  void removeLastCharacter() {
    currentExpression.value = currentExpression.value
        .substring(0, currentExpression.value.length - 1);
  }

  void onButtonPressed(String symbol) {
    if (symbol == 'C') {
      // textEditingController.clear();
      currentExpression.value = '';
    } else if (symbol == '⌫') {
      removeLastCharacter();
    } else if (symbol == '=') {
      try {
        final result = _evaluateExpression(currentExpression.value);
        currentExpression.value = result.toString();
        // textEditingController.text = result.toString();
      } catch (e) {
        currentExpression.value = error;
        // textEditingController.text = 'Error';
      }
    } else {
      bool isOperation =
          symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/';

      String lastSymbol = currentExpression.value.isNotEmpty
          ? currentExpression.value[currentExpression.value.length - 1]
          : '';
      bool endsWithOperation = lastSymbol == '+' ||
          lastSymbol == '-' ||
          lastSymbol == '*' ||
          lastSymbol == '/';

      if (currentExpression.value == error) {
        currentExpression.value = '';
      } else if (isOperation && endsWithOperation) {
        removeLastCharacter();
      }
      currentExpression.value += symbol;
      // textEditingController.text = currentExpression.value;
    }
  }

  double _evaluateExpression(String expression) {
    try {
      Parser parser = Parser();
      Expression exp = parser.parse(expression);

      ContextModel contextModel = ContextModel();

      return exp.evaluate(EvaluationType.REAL, contextModel);
    } catch (e) {
      throw Exception("Invalid Expression");
    }
  }
}
