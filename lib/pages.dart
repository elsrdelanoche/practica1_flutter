import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';
import 'state.dart';

class DeliveryPage extends StatelessWidget {
  const DeliveryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OrderModel>();
    final nameCtrl = TextEditingController(text: vm.current.deliveryName ?? "");
    final addrCtrl = TextEditingController(text: vm.current.deliveryAddress ?? "");
    final notesCtrl = TextEditingController(text: vm.current.notes ?? "");
    return Scaffold(
      appBar: AppBar(title: const Text("Información de Entrega")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _field("Nombre", nameCtrl, (v) => vm.setDelivery(name: v)),
          const SizedBox(height: 12),
          _field("Dirección", addrCtrl, (v) => vm.setDelivery(address: v)),
          const SizedBox(height: 12),
          _field("Notas para el repartidor", notesCtrl, (v) => vm.setDelivery(notes: v)),
        ],
      ),
    );
  }

  Widget _field(String label, TextEditingController c, Function(String) onChanged) {
    return TextField(
      controller: c,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OrderModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Añadir al Carrito")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                vm.addCurrentToCart();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Pizza agregada al carrito")),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Confirmar Pizza"),
            ),
            const SizedBox(height: 12),
            IconButton.filledTonal(
              onPressed: vm.toggleFavorite,
              icon: Icon(vm.favorite ? Icons.favorite : Icons.favorite_border),
              iconSize: 40,
              tooltip: vm.favorite ? "Quitar favorito" : "Marcar favorito",
            ),
          ],
        ),
      ),
    );
  }
}

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OrderModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Elige tus Ingredientes")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("Tamaño", style: TextStyle(fontWeight: FontWeight.bold)),
          RadioListTile<PizzaSize>(
            title: const Text("Pequeña"),
            value: PizzaSize.small,
            groupValue: vm.current.size,
            onChanged: (v) => vm.setSize(v!),
          ),
          RadioListTile<PizzaSize>(
            title: const Text("Mediana"),
            value: PizzaSize.medium,
            groupValue: vm.current.size,
            onChanged: (v) => vm.setSize(v!),
          ),
          RadioListTile<PizzaSize>(
            title: const Text("Grande"),
            value: PizzaSize.large,
            groupValue: vm.current.size,
            onChanged: (v) => vm.setSize(v!),
          ),
          const SizedBox(height: 8),
          const Text("Toppings extra", style: TextStyle(fontWeight: FontWeight.bold)),
          CheckboxListTile(
            title: const Text("Queso"),
            value: vm.current.toppings.contains(Topping.cheese),
            onChanged: (v) => vm.toggleTopping(Topping.cheese, v ?? false),
          ),
          CheckboxListTile(
            title: const Text("Pepperoni"),
            value: vm.current.toppings.contains(Topping.pepperoni),
            onChanged: (v) => vm.toggleTopping(Topping.pepperoni, v ?? false),
          ),
          CheckboxListTile(
            title: const Text("Piña"),
            value: vm.current.toppings.contains(Topping.pineapple),
            onChanged: (v) => vm.toggleTopping(Topping.pineapple, v ?? false),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text("Masa Delgada"),
            value: vm.current.thinCrust,
            onChanged: vm.setThinCrust,
          ),
          const Divider(),
          Text("Resumen: ${vm.current.summaryText()}"),
        ],
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OrderModel>();
    return Scaffold(
      appBar: AppBar(title: const Text("Tu Pedido")),
      body: vm.cart.isEmpty
          ? const Center(child: Text("Tu carrito está vacío"))
          : ListView.separated(
              itemCount: vm.cart.length,
              separatorBuilder: (_, __) => const Divider(height: 0),
              itemBuilder: (context, i) {
                final p = vm.cart[i];
                return ListTile(
                  leading: const Icon(Icons.local_pizza),
                  title: Text(p.name),
                  subtitle: Text(p.summaryText()),
                );
              },
            ),
    );
  }
}

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<OrderModel>();
    final p = vm.current;
    final progress = _progressFor(p);
    return Scaffold(
      appBar: AppBar(title: const Text("Tu Pizza Actual")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SizedBox(height: 8),
            Icon(Icons.local_pizza, size: 160),
            const SizedBox(height: 12),
            Text(p.summaryText()),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: progress),
          ],
        ),
      ),
    );
  }

  double _progressFor(Pizza p) {
    var base = 0.2;
    base += switch (p.size) {
      PizzaSize.small => 0.1,
      PizzaSize.medium => 0.2,
      PizzaSize.large => 0.3,
    };
    base += p.toppings.length * 0.15;
    if (p.thinCrust) base += 0.1;
    return base.clamp(0.0, 1.0);
  }
}
