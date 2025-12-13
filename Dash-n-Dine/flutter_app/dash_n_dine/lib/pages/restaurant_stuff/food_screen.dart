import 'dart:convert';
import 'package:dash_n_dine/pages/restaurant_stuff/food_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FoodListScreen extends StatefulWidget {
  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
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
      appBar: AppBar(title: Text('Food Page')),
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
                    print('Tapped on ${food['foodName']}');
                    // Navigate or perform any action here
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label: Text('Add Food'),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(builder: (context) => AddFoodPage(),
    );
    Navigator.push(context,route);
  }
  

   Future<void> getFoods() async {

    final url = 'http://10.0.2.2:5000/api/Food';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['value'] as List;
      setState(() {
        foods = result;
      });
    } else{
      //show error
    }
    setState(() {
      isLoading = false;
    });
   }
  }