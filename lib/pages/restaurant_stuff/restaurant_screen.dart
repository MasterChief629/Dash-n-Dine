import 'dart:convert';
import 'package:dash_n_dine/pages/restaurant_stuff/restaurant_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestaurantListScreen extends StatefulWidget {
  @override
  _RestaurantListScreenState createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  bool isLoading = true;
  List restaurants = [];

  // Base path for restaurant images
  static const String baseImagePath = 'dash_n_dine_assets/images/';

  @override
  void initState() {
    super.initState();
    getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurant Page')),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: getRestaurants,
          child: ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = restaurants[index] as Map;
              final restaurantName = restaurant['restName'] ?? 'default';
              final formattedName = restaurantName.replaceAll(' ', ''); // remove spaces
              final imagePath = '$baseImagePath$formattedName.png';

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: () {
                    print('Tapped on ${restaurant['restName']}');
                    // Navigate to restaurant page or perform action
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Restaurant image
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
                        // Restaurant details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant['restName'] ?? '',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Text(
                                restaurant['restHours'] ?? '',
                                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                              ),
                              // Optionally add more fields here if needed
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
        label: Text('Add Restaurant'),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddRestaurantPage(),
    );
    Navigator.push(context, route);
  }

  Future<void> getRestaurants() async {
    final url = 'http://10.0.2.2:5000/api/Restaurant';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['value'] as List;
      setState(() {
        restaurants = result;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // Handle error here
    }
  }
}