import 'dart:math';

import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';

double calculateExpectedNumberOfCustomerInTheQueueWithC(StochasticSystemInfo info){
  double lambda = info.lambda;
  double mu = info.mu;
  int? c = info.c;
  final r = lambda / mu;
  final rho = r / c!;
  if (rho >= 1.0) {
    throw ArgumentError("The system is unstable (rho >= 1.0). Lq is infinite.");
  }

  final p0 = calculateP0(lambda, mu, c);
  final numerator = pow(r, c + 1) / c;
  final denominator = factorial(c) * pow(1.0 - r / c, 2);
  final bracketTerm = numerator / denominator;
  final Lq = bracketTerm * p0;
  return Lq.toStringAsFixed(6).toFractionDouble();
} //?
double calculateP0(double lambda, double mu, int c) {
  final r = lambda / mu;
  final rho = r / c;
  if (rho >= 1.0) {
    throw ArgumentError("The system is unstable (rho >= 1.0). Queue length is infinite.");
  }

  double sumTerm = 0.0;
  for (int n = 0; n < c; n++) {
    sumTerm += (pow(r, n) / factorial(n));
  }
  final secondTerm = (pow(r, c) / (factorial(c) * (1 - r / c)));
  return 1.0 / (sumTerm + secondTerm);
}

int factorial(int n) {
  if (n < 0) return 0;
  if (n == 0) return 1;
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}


double calculateExpectedNumberOfCustomerInTheSystemWithC(StochasticSystemInfo info){
  double Lq = calculateExpectedNumberOfCustomerInTheQueueWithC(info);
  double r = info.lambda / info.mu;
  double L = Lq + r;
  return L.toStringAsFixed(6).toFractionDouble();
}

double calculateExpectedWaitingTimeInTheSystemWithC(StochasticSystemInfo info){
  double Lq = calculateExpectedNumberOfCustomerInTheQueueWithC(info);
  double lambda = info.lambda;
  double mu = info.mu;
  double W = (Lq/lambda) + (1/mu);
  return W.toStringAsFixed(6).toFractionDouble();
}

double calculateExpectedWaitingTimeInTheQueueWithC(StochasticSystemInfo info) {
  double Lq = calculateExpectedNumberOfCustomerInTheQueueWithC(info);
  double lambda = info.lambda;
  double Wq = Lq/lambda;
  return Wq.toStringAsFixed(6).toFractionDouble();
}