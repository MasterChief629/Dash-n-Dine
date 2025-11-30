import 'package:flutter/material.dart';
import 'package:dash_n_dine/pages/general_stuff/splash_screen.dart';
import 'package:dash_n_dine/pages/general_stuff/welcome_page.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

Future main() async {
  await Settings.init(cacheProvider: SharePreferenceCache()); //this can also be used with SQL, will have to look into how to do it though, and if we woul dwant/need to do it.
  runApp(MaterialApp(
    home: SplashScreen(
      duration: 3,
      goToPage: WelcomePage(),
    )
   )
  );
}



/*
//remember to add the fonts to both the fonts folder and the pubspec.yaml.
//need to uncomment the font in the pubspec.yaml file, and change the fonts to the ones we add
//change the following

fonts:
  #   - family: <our font name>
  #     fonts:
  #       - asset: fonts/<our font name>-Regular.ttf
  #       - asset: fonts/<our font name>-Italic.ttf //can change this to whatever, doesnt have to be italic
DONT FORGET TO INPUT THE FOLLOWING COMMAND INTO THE TERMINAL: flutter pub get
*/