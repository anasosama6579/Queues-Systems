

import 'package:Queue_Systems/main.dart';
import 'package:Queue_Systems/models/system_info.dart';

double calculateExpectedNumberOfCustomerInTheSystem(StochasticSystemInfo info){
  double lambda = info.lambda;
  double mu = info.mu;
  double L = lambda/(mu-lambda);

  return L.toSignificantDigits(6);
}

double calculateExpectedNumberOfCustomerInTheQueue(StochasticSystemInfo info) {
  double lambda = info.lambda;
  double mu = info.mu;
  double Lq = (lambda*lambda)/(mu*(mu-lambda));

  return Lq.toSignificantDigits(6);
}
double calculateExpectedWaitingTimeInTheSystem(StochasticSystemInfo info) {
  double lambda = info.lambda;
  double mu = info.mu;
  double W = 1/(mu-lambda);

  return W.toSignificantDigits(6);
}
double calculateExpectedWaitingTimeInTheQueue(StochasticSystemInfo info) {
  double lambda = info.lambda;
  double mu = info.mu;
  double Wq = (lambda)/(mu*(mu-lambda));

  return Wq.toSignificantDigits(6);
}
