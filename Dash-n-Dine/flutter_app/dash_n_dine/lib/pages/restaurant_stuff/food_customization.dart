import 'package:flutter/material.dart';
import 'package:dash_n_dine/pages/restaurant_stuff/cart_provider.dart';
import 'cart_page.dart';

class FoodCustomizationPage extends StatefulWidget {
  final Map<String, dynamic> food;

  const FoodCustomizationPage({required this.food, Key? key}) : super(key: key);

  @override
  _FoodCustomizationPageState createState() => _FoodCustomizationPageState();
}

class _FoodCustomizationPageState extends State<FoodCustomizationPage> {
  late final List<String> customizationOptions;
  final Set<String> selectedOptions = {};

  @override
  void initState() {
    super.initState();

    customizationOptions = (widget.food['customization'] as String? ?? "")
        .split(',')
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final food = widget.food;
    final String foodName = food['foodName'] ?? "Food Item";
    final String foodDescription = food['foodDescription'] ?? "";
    final double price = (food['price'] is num) ? (food['price'] as num).toDouble() : 0.0;

    return Scaffold(
      appBar: AppBar(title: Text("$foodName Options")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (foodDescription.isNotEmpty)
              Text(foodDescription, style: const TextStyle(fontSize: 16)),
            if (foodDescription.isNotEmpty) const SizedBox(height: 20),
            const Text(
              "Choose Options:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: customizationOptions.isEmpty
                  ? const Center(child: Text("No customizations available."))
                  : ListView(
                      children: customizationOptions.map((option) {
                        final isSelected = selectedOptions.contains(option);
                        return CheckboxListTile(
                          title: Text(option),
                          value: isSelected,
                          onChanged: (value) {
                            setState(() {
                              if (value == true) {
                                selectedOptions.add(option);
                              } else {
                                selectedOptions.remove(option);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final cartItem = CartItem(
                    foodID: widget.food['foodID'],
                    menuID: widget.food['menuID'],
                    selectedOptions: selectedOptions.join(","),
                    price: widget.food['price'],
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CartPage(
                      cartItems: [cartItem],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Add to Order - \$${price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}