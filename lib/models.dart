enum PizzaSize { small, medium, large }
enum Topping { cheese, pepperoni, pineapple }

class Pizza {
  String name;
  PizzaSize size;
  Set<Topping> toppings;
  bool thinCrust;
  String? notes;
  String? deliveryName;
  String? deliveryAddress;

  Pizza({
    this.name = "Pizza personalizada",
    this.size = PizzaSize.medium,
    Set<Topping>? toppings,
    this.thinCrust = false,
    this.notes,
    this.deliveryName,
    this.deliveryAddress,
  }) : toppings = toppings ?? <Topping>{};

  int get price {
    final base = switch (size) {
      PizzaSize.small => 80,
      PizzaSize.medium => 120,
      PizzaSize.large => 160,
    };
    final extra = toppings.fold<int>(0, (acc, t) {
      return acc +
          switch (t) {
            Topping.cheese => 15,
            Topping.pepperoni => 20,
            Topping.pineapple => 15,
          };
    });
    final crust = thinCrust ? 5 : 0;
    return base + extra + crust;
  }

  String summaryText() {
    final sizeLabel = switch (size) {
      PizzaSize.small => "Pequeña",
      PizzaSize.medium => "Mediana",
      PizzaSize.large => "Grande",
    };
    final tops = toppings.isEmpty
        ? "Sin toppings"
        : toppings.map((t) {
            return switch (t) {
              Topping.cheese => "Queso",
              Topping.pepperoni => "Pepperoni",
              Topping.pineapple => "Piña",
            };
          }).join(", ");
    final masa = thinCrust ? "Masa delgada" : "Masa normal";
    return "$sizeLabel | $tops | $masa | \$${price}";
  }

  Pizza copy() => Pizza(
        name: name,
        size: size,
        toppings: Set.of(toppings),
        thinCrust: thinCrust,
        notes: notes,
        deliveryName: deliveryName,
        deliveryAddress: deliveryAddress,
      );
}
