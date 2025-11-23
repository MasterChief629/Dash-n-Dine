import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'package:dash_n_dine/helpers/utils.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/pages/general_stuff/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

//Main settings page

//Main things it has
/*
  - button for user settings (redirect to user settings page)
  - button for account settings (redirect to account settings | this is different from user settings)
  - account settings will have a button for changing the user's information (credit card/maryville wallet (obviously, we cant do this one, so we will probably have to make up fake accounts for this)) , and adding/removing credit cards/maryville wallet
*/

//class
class MainSettings extends StatelessWidget {
  const MainSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main settings page'),
        backgroundColor: AppColors.DARK_RED,
      ),
    );
  }
}
