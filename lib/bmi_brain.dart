import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String BmiCalculator() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String BmiDescription() {
    if (_bmi > 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String BmiComment() {
    if (_bmi > 25) {
      return 'You should exercise more!';
    } else if (_bmi > 18.5) {
      return 'Great job!';
    } else {
      return 'You should eat a little more!';
    }
  }
}
