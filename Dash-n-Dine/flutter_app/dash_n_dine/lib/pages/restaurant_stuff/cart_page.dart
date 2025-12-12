import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dash_n_dine/pages/restaurant_stuff/cart_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dash_n_dine/pages/general_stuff/home.dart';


class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartPage({required this.cartItems, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final total = cartItems.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(title: const Text("Cart")),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final item = cartItems[index];
          return ListTile(
            title: Text("Food ID: ${item.foodID}"),
            subtitle: Text("Options: ${item.selectedOptions}"),
            trailing: Text("\$${item.price.toStringAsFixed(2)}"),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          child: Text("Checkout  -  \$${total.toStringAsFixed(2)}"),
          onPressed: () async {
            await submitOrder(context, cartItems);
          },
        ),
      ),
    );
  }


  Future<void> submitOrder(
    BuildContext context, List<CartItem> cartItems) async {
  
    final url = Uri.parse("http://10.0.2.2:5000/api/Order");

    for (final item in cartItems) {

      final newID = await getNextOrderID();

      final restID = await getRestIDFromMenu(item.menuID);

      final orderData = {
        "orderID": newID,
        "foodID": item.foodID,
        "restID": restID,
        "orderTime": DateTime.now().toIso8601String(),
        "totalPrice": item.price,
        "orderStatus": "Processing"
      };

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(orderData),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        debugPrint('Status: ${response.statusCode}');
        debugPrint('Body: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to submit order: ${response.statusCode}")),
        );
        return;
      }
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Order submitted!")),
    );

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
      (route) => false, // removes all previous routes
    );
  }

  Future<int> getNextOrderID() async {
    final url = Uri.parse("http://10.0.2.2:5000/api/Order");

    final response = await http.get(url);
    if (response.statusCode != 200) return 1;

    final data = jsonDecode(response.body);
    final List orders = data['value'];

    if (orders.isEmpty) return 1;

    int maxId = 0;
    for (final order in orders) {
      if (order['orderID'] > maxId) {
        maxId = order['orderID'];
      }
    }

    return maxId + 1;
  }


  Future<int> getRestIDFromMenu(int menuID) async {
    final url = Uri.parse("http://10.0.2.2:5000/api/Menu/menuID/$menuID");
    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to fetch menu");
    }

    final data = jsonDecode(response.body);

    final menuItem = data['value'][0];

   // Make sure it's an int
    return menuItem['restID'] is int
        ? menuItem['restID']
        : int.parse(menuItem['restID'].toString());
  }

}