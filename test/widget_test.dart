import 'package:flutter_test/flutter_test.dart';
import 'package:elabd_coupon_app/main.dart';

void main() {
  testWidgets('App starts successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const ElAbdCouponApp());

    expect(find.text('El Abd Foods'), findsOneWidget);
    expect(find.text('Coupon System'), findsOneWidget);
  });
}