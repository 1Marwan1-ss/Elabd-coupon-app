import 'drink.dart';

class Redemption {
  final Drink drink;
  final DateTime redeemedAt;
  final String branch;
  const Redemption({
    required this.drink,
    required this.redeemedAt,
    required this.branch,
  });
}
