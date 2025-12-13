import 'package:flutter/foundation.dart';

class CartItem {
  final int foodID;
  final int menuID;
  final String selectedOptions;
  final double price;

  CartItem({
    required this.foodID,
    required this.menuID,
    required this.selectedOptions,
    required this.price,
  });
}