import 'dart:math';

class Range {
  late double rangeFrom;
  late double rangeTo;

  Range(this.rangeFrom, this.rangeTo);
}

class Calc {
  double? _result;
  late Range range;
  late double step;

  Calc(this.range, {this.step = 0.1});

  double? get result => _result;

  setStep(double value) {
    this.step = value;
  }

  runCalc() {
    var x = range.rangeFrom;
    double sum = 0;

    do {
      final y = _calc(x);

      print("x = $x, 5x / 4x^2 = $y");

      x+= step;

      sum+=y;
    } while(x < range.rangeTo);

    _result = sum;
  }

  double _calc(double x) {
    return (5 * x) / (4 * x * x);
  }
}