import '../models/sandwich.dart';
import '../repositories/pricing_repository.dart';

class Cart {
  final PricingRepository _pricingRepository;
  final List<Sandwich> _items = [];

  Cart({required PricingRepository pricingRepository})
      : _pricingRepository = pricingRepository;

  List<Sandwich> get items => _items;

  void add(Sandwich sandwich) {
    _items.add(sandwich);
  }

  void remove(Sandwich sandwich) {
    var remove = _items.remove(sandwich);
  }

  double get totalPrice {
    if (_items.isEmpty) {
      return 0.0;
    }
    return _items.fold(0.0, (total, sandwich) {
      return total +
          _pricingRepository.calculatePrice(
            quantity: 1, // Each sandwich is one item
            isFootlong: sandwich.isFootlong,
          );
    });
  }
}