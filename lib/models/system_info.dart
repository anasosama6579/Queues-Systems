class DeterministicSystemInfo {
   double lambda;
   double mu;
   double time;
   double? k;
   double? m;

  DeterministicSystemInfo(
      {required this.lambda,
      required this.mu,
      required this.time,
      required this.k,
      required this.m});
}

class StochasticSystemInfo {
  double lambda;
  double mu;
  double? K;
  int? c;

  StochasticSystemInfo(
      {required this.lambda, required this.mu, this.K, this.c});
}
