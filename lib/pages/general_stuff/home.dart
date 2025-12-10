import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'package:dash_n_dine/helpers/utils.dart';
import 'package:flutter/material.dart';
import 'package:dash_n_dine/pages/settings/main_settings.dart';
import 'package:dash_n_dine/pages/general_stuff/test_page.dart';
import 'package:dash_n_dine/pages/restaurant_stuff/food_screen.dart';
import 'package:dash_n_dine/pages/restaurant_stuff/menu_screen.dart';
import 'package:dash_n_dine/pages/restaurant_stuff/restaurant_screen.dart';
import "package:dash_n_dine/pages/restaurant_stuff/restaurant_menu_display.dart";
//This page is a TEST PAGE for now, will rewrite everything to make it look nicer later

class HomePage extends StatefulWidget {
  List<Categories> categories = Utils.getCategories();

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  List restaurants = [];
  Future<List<int>> getFoodIdsForRestaurant(int restID) async {
    final response = await http.get(Uri.parse("http://10.0.2.2:5000/api/Menu"));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map;
      final List menus = jsonData["value"];
      final menu = menus.firstWhere(
        (m) => m["restID"] == restID,
        orElse: () => null,
      );
      if (menu == null) {
      return []; 
      }
      return (menu["foodIDlist"] as String)
          .split(",")
          .map((id) => int.parse(id))
          .toList();
    } 
    return [];
  }
  static const String baseImagePath = 'dash_n_dine_assets/images/';
  @override
  void initState() {
    super.initState();
    getRestaurants();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[buildHeader(context), buildMenuItems(context)],
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: Text('Dash N\' Dine!', textAlign: TextAlign.center),
        backgroundColor: AppColors.DARK_RED,
      ),
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
              final formattedName = restaurantName.replaceAll(' ', '');
              final imagePath = '$baseImagePath$formattedName.png';

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: () async{
                    int restID = restaurant['restID'];
                    String restName = restaurant['restName'];

                    List<int> foodIds = await getFoodIdsForRestaurant(restID);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MenuItemsScreen(
                        foodIds: foodIds,
                        restaurantName: restName,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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

//methods
Widget buildHeader(BuildContext context) => Container(
  color: AppColors.DARK_RED,
  padding: EdgeInsets.only(
    top: 24 + MediaQuery.of(context).padding.top,
    bottom: 24,
  ),
  child: Column(
    children: [
      CircleAvatar(
        radius: 50,
        backgroundImage: NetworkImage(
          IconFontHelper.LOGO,
        ), //image not showing up, will fix later
      ),
      SizedBox(height: 12),
      /*
      Text(
        realname, // Display real name
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
      Text(
        email, // Display email
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
      */
    ],
  ),
);

Widget buildMenuItems(BuildContext context) => Column(
  children: [
    ListTile(
      //home page
      leading: const Icon(Icons.home_outlined),
      title: const Text('Home'),
      //Route back to home page
      onTap: () => Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => HomePage())),
    ),
    //main settings page
    ListTile(
      leading: const Icon(Icons.settings),
      title: const Text('Main Settings'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MainSettings()),
      ), //route to main settings page
    ),
    //cart
    ListTile(
      leading: const Icon(Icons.shopping_cart),
      title: const Text('Cart'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TestPage()),
      ), //route to cart
    ),
    //Notifications (Only do this if we have time)
    ListTile(
      leading: const Icon(Icons.notifications),
      title: const Text('Notifications'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TestPage()),
      ), //route to Notifications page (may have to cut this one if we dont have time)
    ),
    //order status
    ListTile(
      leading: const Icon(Icons.timer_outlined),
      title: const Text('Order Status'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => TestPage()),
      ), //route to order status page
    ),
        ListTile(
      leading: const Icon(Icons.timer_outlined),
      title: const Text('Restaurants adding'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => RestaurantListScreen()),
      ), //route to order status page
    ),
    ListTile(
      leading: const Icon(Icons.timer_outlined),
      title: const Text('Foods adding'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => FoodListScreen()),
      ), //route to order status page
    ),
    ListTile(
      leading: const Icon(Icons.timer_outlined),
      title: const Text('Menus adding'),
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MenuListScreen()),
      ), //route to order status page
    ),
  ],
);
