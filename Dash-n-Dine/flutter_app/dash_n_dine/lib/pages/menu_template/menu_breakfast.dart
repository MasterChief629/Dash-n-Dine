import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'package:dash_n_dine/helpers/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//This page is a TEST PAGE for now, will rewrite everything to make it look nicer later

class BreakfastMenu extends StatelessWidget {
  List<Categories> categories = Utils.getBreakfastCategories();

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
                "(Placeholder text) List of Menu Items",
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