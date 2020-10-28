class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBrain() {
    _bmi = weight / ((height * height) / 10000);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWieght';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal,try to exercise more';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body';
    } else {
      return 'You have a lower than normal,try to eat more';
    }
  }
}
