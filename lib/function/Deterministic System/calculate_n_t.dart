double calculateN({required double lambda, required double mu, required double t}) {
  double termOne = lambda * t;
  double termOneFloor = termOne.floor().toDouble();
  double termTwo = (mu * t) - (mu / lambda);
  double termTwoFloor = termTwo.floor().toDouble();
  double n = termOneFloor - termTwoFloor;

  return n;
}

