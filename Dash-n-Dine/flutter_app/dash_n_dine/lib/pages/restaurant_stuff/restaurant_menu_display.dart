import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "package:dash_n_dine/pages/restaurant_stuff/food_customization.dart";

class MenuItemsScreen extends StatefulWidget {
  final List<int> foodIds;
  final String restaurantName;

  MenuItemsScreen({
    required this.foodIds,
    required this.restaurantName,
    });

  @override
  _MenuItemsScreenState createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  static const String baseImagePath = 'dash_n_dine_assets/images/';
  bool isLoading = true;
  List foods = [];

  @override
  void initState() {
    super.initState();
    getFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.restaurantName} Menu"),
        ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: getFoods,
          child: ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, index) {
              final food = foods[index] as Map;
              final imagePath = '$baseImagePath${food['imagePath']}';

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: () {
                    final dynamic item = foods[index];
                    if (item is Map<String, dynamic>) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FoodCustomizationPage(food: item),
                        ),
                      );
                    } else {
                      print("Invalid food item at index $index");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Error: Unable to open food item.")),
                      );
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Food image
                        Image.asset(
                          imagePath,
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image_not_supported, size: 120);
                          },
                        ),
                        SizedBox(width: 16),
                        // Food details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                food['foodName'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                '\$${food['price'].toStringAsFixed(2)}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 8),
                              Text(
                                food['foodDescription'] ?? '',
                                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /*void navigateToCustomizationPage() {
    final route = MaterialPageRoute(builder: (context) => CustomizationPage(),
    );
    Navigator.push(context,route);
  }*/
  

  Future<void> getFoods() async {
    final url = 'http://10.0.2.2:5000/api/Food';
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['value'] as List;

      List allFoods = result;


      foods = allFoods.where((food) {
        int id = food['foodID'];
        return widget.foodIds.contains(id);
      }).toList();
    }

    setState(() => isLoading = false);
  }
}