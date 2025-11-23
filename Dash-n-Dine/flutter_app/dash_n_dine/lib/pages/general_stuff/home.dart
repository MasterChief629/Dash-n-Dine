import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'package:dash_n_dine/helpers/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

//This page is a TEST PAGE for now, will rewrite everything to make it look nicer later

class HomePage extends StatelessWidget {
  List<Categories> categories = Utils.getCategories();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "(Placeholder text) List of Restaurants",
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.BLACK_COLOR),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Container(
                    margin: EdgeInsets.all(20),
                    height: 150,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Image.asset('dash_n_dine_assets/images/${categories[index].imageName!}')
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
A change I'm thinking of:
instead of having separate buttons for the cart and settings, we could put both in the drawer (hamburger menu), 
*/
