import 'calc.dart';

void main() {
  final range = Range(-1, 1);
  final calc = Calc(range);
  calc.setStep(0.2);
  calc.runCalc();

  print(calc.result);
}