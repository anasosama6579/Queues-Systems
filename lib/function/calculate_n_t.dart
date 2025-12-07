double calculateN({required double lambda, required double mu, required double t}) {
  double termOne = lambda * t;
  double termOneFloor = termOne.floor().toDouble();
  double termTwo = (mu * t) - (mu / lambda);
  double termTwoFloor = termTwo.floor().toDouble();
  double n = termOneFloor - termTwoFloor;

  return n;
}

extension StringToDouble on String {
  double toFractionDouble() {
    if (contains('/')) {
      final parts = split('/');
      if (parts.length == 2) {
        final num = double.tryParse(parts[0]) ?? 0;
        final den = double.tryParse(parts[1]) ?? 1;
        return num / den;
      }
    }
    return double.tryParse(this) ?? 0;
  }
}