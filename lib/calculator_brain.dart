
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight, required this.bmi});

  final int height;
  final int weight;
  double bmi;

  String BmiCalculator() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String BmiResult() {
    if (bmi >= 25) {
      return 'Overweight';
    } else if (bmi > 18.5) {
      return 'Normal';
    } else
      return 'Underweight';
  }

  String BmiInterpretation() {
    if (bmi >= 25) {
      return 'you have a higher than normal body weight, Try to exercise more';
    } else if (bmi > 18.5) {
      return 'You have a normal body weigth, Good job!';
    } else {
      return 'You have a lower than normal body weight, Try to eat more ';
    }
  }
}