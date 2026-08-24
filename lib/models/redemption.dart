import 'drink.dart';

class Redemption {
  final Drink drink;
  final DateTime redeemedAt;
  final String branch;
  final String? customerName;
  const Redemption({
    required this.drink,
    required this.redeemedAt,
    required this.branch,
    this.customerName,
  });
}
