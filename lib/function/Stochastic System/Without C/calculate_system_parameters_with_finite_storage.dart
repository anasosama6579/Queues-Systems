import 'dart:math';

import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';

double calculateExpectedNumberOfCustomerInTheSystemWithFiniteStorage(StochasticSystemInfo info) {
  double rho = info.lambda/info.mu;
  double? k = info.K;
  double L = 0;
   if (rho == 1) {
      L = k!/2;
     return L;
   }
   else{
     double rhoPowK = pow(rho, k!).toDouble();
     double rhoPowKPlus1 = pow(rho, k + 1).toDouble();
     double numerator = 1.0 - (k + 1) * rhoPowK + k * rhoPowKPlus1;
     double denominator = (1.0 - rho) * (1.0 - rhoPowKPlus1);
     L = rho * (numerator / denominator);
     return L.toStringAsFixed(5).toFractionDouble();
   }
}

double calculatePSubK(StochasticSystemInfo info){
  double rho = info.lambda/info.mu;
  double? k = info.K;
  if (rho == 1) {
    return 1/(k!+1);
  }
  else{
    double rhoPowK = pow(rho, k!).toDouble();
    double rhoPowKPlus1 = pow(rho, k+1).toDouble();
    double oneMinusRho = 1-rho;

    return (rhoPowK*(oneMinusRho/(1-rhoPowKPlus1))).toStringAsFixed(5).toFractionDouble();
  }
}

double calculateLambdaDash(StochasticSystemInfo info){
  double lambda = info.lambda;
  double lambdaDash = lambda*(1-calculatePSubK(info));
  return lambdaDash.toStringAsFixed(5).toFractionDouble();
}


double calculateExpectedWaitingTimeInTheSystemWithFiniteStorage (StochasticSystemInfo info){
  double L = calculateExpectedNumberOfCustomerInTheSystemWithFiniteStorage(info);
  double lambdaDash = calculateLambdaDash(info);
  double W = L/lambdaDash;
  return W.toStringAsFixed(5).toFractionDouble();
}

double calculateExpectedWaitingTimeInTheQueueWithFiniteStorage (StochasticSystemInfo info){
  double mu = info.mu;
  double Wq = calculateExpectedWaitingTimeInTheSystemWithFiniteStorage(info)-(1/mu);
  return Wq.toStringAsFixed(5).toFractionDouble();
}

double calculateExpectedNumberOfCustomerInTheQueueWithFiniteStorage(StochasticSystemInfo info){
  double Lq = calculateLambdaDash(info)*calculateExpectedWaitingTimeInTheQueueWithFiniteStorage(info);
  return Lq.toStringAsFixed(5).toFractionDouble();
}
