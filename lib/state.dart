import 'package:flutter/foundation.dart';
import 'models.dart';

class OrderModel extends ChangeNotifier {
  Pizza _current = Pizza();
  final List<Pizza> _cart = [];
  bool favorite = false;

  Pizza get current => _current;
  List<Pizza> get cart => List.unmodifiable(_cart);

  void setDelivery({String? name, String? address, String? notes}) {
    _current.deliveryName = name ?? _current.deliveryName;
    _current.deliveryAddress = address ?? _current.deliveryAddress;
    _current.notes = notes ?? _current.notes;
    notifyListeners();
  }

  void setSize(PizzaSize size) {
    _current.size = size;
    notifyListeners();
  }

  void toggleTopping(Topping t, bool checked) {
    if (checked) {
      _current.toppings.add(t);
    } else {
      _current.toppings.remove(t);
    }
    notifyListeners();
  }

  void setThinCrust(bool thin) {
    _current.thinCrust = thin;
    notifyListeners();
  }

  void addCurrentToCart() {
    _cart.add(_current.copy());
    notifyListeners();
  }

  void toggleFavorite() {
    favorite = !favorite;
    notifyListeners();
  }
}
