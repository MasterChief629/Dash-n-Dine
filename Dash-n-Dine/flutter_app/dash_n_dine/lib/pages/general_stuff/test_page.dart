import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'package:dash_n_dine/helpers/utils.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/pages/general_stuff/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dash_n_dine/helpers/texthelper.dart';

//this is a placeholder page, remove from final iteration of project

//class
class TestPage extends StatelessWidget{
  const TestPage({Key? key}) : super(key: key);
  
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
            
          ],
        ),
      ),
    );
  }
}