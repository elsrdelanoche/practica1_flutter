import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'state.dart';
import 'pages.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => OrderModel(),
      child: const PizzaApp(),
    ),
  );
}

class PizzaApp extends StatefulWidget {
  const PizzaApp({super.key});

  @override
  State<PizzaApp> createState() => _PizzaAppState();
}

class _PizzaAppState extends State<PizzaApp> {
  int _index = 0;

  final _pages = const [
    DeliveryPage(),
    IngredientsPage(),
    ConfirmPage(),
    CartPage(),
    SummaryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 1 - Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFBB86FC),
          surface: Color(0xFF1E1E1E),
          background: Color(0xFF121212),
        ),
      ),
      home: Scaffold(
        body: _pages[_index],
        bottomNavigationBar: NavigationBar(
          selectedIndex: _index,
          onDestinationSelected: (i) => setState(() => _index = i),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.local_shipping), label: "Entrega"),
            NavigationDestination(icon: Icon(Icons.restaurant), label: "Ingredientes"),
            NavigationDestination(icon: Icon(Icons.check_circle), label: "Confirmar"),
            NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Carrito"),
            NavigationDestination(icon: Icon(Icons.summarize), label: "Resumen"),
          ],
        ),
      ),
    );
  }
}
