import 'dart:math';

void main() {
  const valueFrom = -3.0;
  const valueTo = 8.0;
  const step = 0.5;

  print("y = x^2 - 2 * x^3\n");

  var x = valueFrom + step;
  var sum = 0.0;
  var count = 0;

  for (x; x < valueTo; x+=step) {
    final y = calc(x);
    print("x = $x, $x^2 - 2 * $x^3 = $y");
    sum += y;
    count++;
  }

  final mean = sum / count;
  print("\nmean = $mean");
}

double calc(double x) {
  return x * x - 2 * x * x * x;
}