import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/models/cart.dart';
import 'package:myapp/models/sandwich.dart';
import 'package:myapp/repositories/pricing_repository.dart';

import 'cart_test.mocks.dart';

@GenerateMocks([PricingRepository])
void main() {
  group('Cart', () {
    late MockPricingRepository mockPricingRepository;
    late Cart cart;

    setUp(() {
      mockPricingRepository = MockPricingRepository();
      cart = Cart(pricingRepository: mockPricingRepository);
    });

    test('starts with an empty list of items', () {
      expect(cart.items, isEmpty);
    });

    test('add() adds a sandwich to the cart', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.wheat,
        isFootlong: false,
      );
      cart.add(sandwich);
      expect(cart.items, [sandwich]);
    });

    test('remove() removes a sandwich from the cart', () {
      final sandwich = Sandwich(
        type: SandwichType.veggieDelight,
        breadType: BreadType.wheat,
        isFootlong: false,
      );
      cart.add(sandwich);
      cart.remove(sandwich);
      expect(cart.items, isEmpty);
    });

    test('totalPrice returns 0 for an empty cart', () {
      expect(cart.totalPrice, 0.0);
    });

    test('totalPrice calculates the correct price for items in the cart', () {
      // Arrange
      final sixInch = Sandwich(
          type: SandwichType.veggieDelight,
          breadType: BreadType.wheat,
          isFootlong: false);
      final footlong = Sandwich(
          type: SandwichType.chickenTeriyaki,
          breadType: BreadType.white,
          isFootlong: true);

      when(mockPricingRepository.calculatePrice(
              quantity: 1, isFootlong: false))
          .thenReturn(6.50); // Mock price for a 6-inch
      when(mockPricingRepository.calculatePrice(quantity: 1, isFootlong: true))
          .thenReturn(10.0); // Mock price for a footlong

      // Act
      cart.add(sixInch);
      cart.add(footlong);

      // Assert
      expect(cart.totalPrice, 16.50);
    });
  });
}
