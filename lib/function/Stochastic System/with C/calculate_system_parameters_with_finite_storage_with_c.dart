import 'dart:math';

import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';

int factorial(int n) {
  if (n < 0) return 0;
  if (n == 0) return 1;
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

double calculateP0(double lambda, double mu, int c, int K) {
  final r = lambda / mu;
  final rho = r / c;
  double sumTerm_1 = 0.0;
  for (int n = 0; n < c; n++) {
    sumTerm_1 += (pow(r, n) / factorial(n));
  }
  final commonFactor = pow(r, c) / factorial(c);
  double sumTerm_2 = 0.0;
  if ((rho - 1.0).abs() < 1e-9) {
    sumTerm_2 = commonFactor * (K - c + 1).toDouble();
  } else {
    final geometricSum = (1.0 - pow(rho, K - c + 1)) / (1.0 - rho);
    sumTerm_2 = commonFactor * geometricSum;
  }
  return 1.0 / (sumTerm_1 + sumTerm_2);
}


double calculatePK(double lambda, double mu, int c, int K) {
  final r = lambda / mu;
  final rho = r / c;
  final p0 = calculateP0(lambda, mu, c, K);

  double pk;
  if ((rho - 1.0).abs() < 1e-9) {
    pk = (pow(r, c) / factorial(c)) * p0;
  } else {
    pk = (pow(r, c) / factorial(c)) * pow(rho, K - c) * p0;
  }
  return pk;
}

double calculateEffectiveArrivalRate(double lambda, double mu, int c, int K) {
  final pk = calculatePK(lambda, mu, c, K);
  return lambda * (1.0 - pk);
}

double calculateExpectedNumberOfCustomerInTheQueueWithFiniteSystemWithC(StochasticSystemInfo info) {
  final lambda = info.lambda;
  final mu = info.mu;
  final c = info.c!;
  final K = info.K!;

  if (c > K) {
    throw ArgumentError("The number of servers (c) cannot be greater than the system capacity (K).");
  }

  final r = lambda / mu;
  final rho = r / c;
  final p0 = calculateP0(lambda, mu, c, K.toInt());

  double Lq;

  if ((rho - 1.0).abs() < 1e-9) {
    final term1 = pow(r, c) / factorial(c);
    final term2 = (K - c) * (K - c + 1) / 2.0;
    Lq = p0 * term1 * term2;
  } else {

    final term1 = (rho * pow(r, c) * p0) / (factorial(c) * pow(1.0 - rho, 2));

    final kMinusCPlus1 = K - c + 1;
    final powerKC = pow(rho, K - c);

    final termInBrackets =
        1.0 -
            pow(rho, kMinusCPlus1) -
            (1.0 - rho) * kMinusCPlus1 * powerKC;

    Lq = term1 * termInBrackets;
  }

  return Lq.toStringAsFixed(6).toFractionDouble();
}

double calculateExpectedNumberOfCustomerInTheSystemWithFiniteSystemWithC(StochasticSystemInfo info) {
  final lambda = info.lambda;
  final mu = info.mu;
  final c = info.c!;
  final K = info.K!;
  final Lq = calculateExpectedNumberOfCustomerInTheQueueWithFiniteSystemWithC(info);
  final r = lambda / mu;

  double sumTerm = 0.0;
  for (int n = 0; n < c; n++) {
    sumTerm += (c - n) * (pow(r, n) / factorial(n));
  }
  final p0 = calculateP0(lambda, mu, c, K.toInt());
  final L = Lq + c - p0 * sumTerm;
  return L.toStringAsFixed(6).toFractionDouble();
}

double calculateExpectedWaitingTimeInTheQueueWithFiniteSystemWithC(StochasticSystemInfo info) {
  final c = info.c!;
  final K = info.K!;
  final Lq = calculateExpectedNumberOfCustomerInTheQueueWithFiniteSystemWithC(info);
  final lambdaEff = calculateEffectiveArrivalRate(info.lambda, info.mu, c, K.toInt());
  final Wq = Lq / lambdaEff;
  return Wq.toStringAsFixed(6).toFractionDouble();
}


double calculateExpectedWaitingTimeInTheSystemWithFiniteSystemWithC(StochasticSystemInfo info) {
  final c = info.c!;
  final K = info.K!;
  final L = calculateExpectedNumberOfCustomerInTheSystemWithFiniteSystemWithC(info);
  final lambdaEff = calculateEffectiveArrivalRate(info.lambda, info.mu, c, K.toInt());
  final W = L / lambdaEff;
  return W.toStringAsFixed(6).toFractionDouble();
}