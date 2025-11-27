
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/models/sandwich.dart';

void main() {
  group('Sandwich', () {
    test('name getter returns correct name for each sandwich type', () {
      final veggie = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      expect(veggie.name, 'Veggie Delight');

      final chicken = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(chicken.name, 'Chicken Teriyaki');

      final tuna = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: false,
        breadType: BreadType.wholemeal,
      );
      expect(tuna.name, 'Tuna Melt');

      final meatball = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(meatball.name, 'Meatball Marinara');
    });

    test('image getter returns correct path for six-inch sandwiches', () {
      final veggie = Sandwich(
        type: SandwichType.veggieDelight,
        isFootlong: false,
        breadType: BreadType.wheat,
      );
      expect(veggie.image, 'assets/images/veggieDelight_six_inch.png');

      final chicken = Sandwich(
        type: SandwichType.chickenTeriyaki,
        isFootlong: false,
        breadType: BreadType.white,
      );
      expect(chicken.image, 'assets/images/chickenTeriyaki_six_inch.png');
    });

    test('image getter returns correct path for footlong sandwiches', () {
      final tuna = Sandwich(
        type: SandwichType.tunaMelt,
        isFootlong: true,
        breadType: BreadType.wholemeal,
      );
      expect(tuna.image, 'assets/images/tunaMelt_footlong.png');

      final meatball = Sandwich(
        type: SandwichType.meatballMarinara,
        isFootlong: true,
        breadType: BreadType.white,
      );
      expect(meatball.image, 'assets/images/meatballMarinara_footlong.png');
    });
  });
}
