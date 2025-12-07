// void main() {
//   print(getXSpots(mu: 2, lamda: 4, time: 64, m: 10, arrivesXs: _arrivesArrowSpots(lamda: 4, time: 64)));
//   print(_arrivesArrowSpots(lamda: 4, time: 50));
//
// }
//
// List<double> getXSpots({required double mu, required double lamda, required double time, required double m, required List<double> arrivesXs}) {
//   List<double> xs = [];
//   for (double i = 1; i <= m; i++) {
//     xs.add(i * mu);
//   }
//   int counter = 0;
//   for (double i = 1; i <= time; i++) {
//     if (arrivesXs[counter] < (i + m) * mu) {
//       if ((i + m) * mu <= time) {
//         xs.add((i + m) * mu);
//       }
//       counter++;
//     }
//     if (counter >= arrivesXs.length) {
//       break;
//     }
//   }
//
//   return xs;
// }
//
// List<double> _arrivesArrowSpots({required double lamda, required double time}) {
//   List<double> xs = [];
//   for (int i = 1; i < time / lamda; i++) {
//     xs.add(lamda * i);
//   }
//
//   return xs;
// }
