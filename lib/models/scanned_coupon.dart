class ScannedCoupon {
  final String customerName;
  final String drinkName;
  final String drinkImagePath;
  final int remainingBefore;
  final int totalDrinks;
  final bool isValid;

  const ScannedCoupon({
    required this.customerName,
    required this.drinkName,
    required this.drinkImagePath,
    required this.remainingBefore,
    required this.totalDrinks,
    required this.isValid,
  });
}
