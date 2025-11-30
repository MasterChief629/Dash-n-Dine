import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/models/categories.dart';
import 'package:dash_n_dine/helpers/utils.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/pages/general_stuff/home.dart';
import 'package:dash_n_dine/widgets/icon_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:dash_n_dine/widgets/icon_widget.dart';

class AccountPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
    title: 'Account Settings',
    subtitle: 'Privacy, Security, Language',
    leading: IconWidget(icon: Icons.person, color: Colors.green),
    child: SettingsScreen(
      title: 'Account Settings',
      children: <Widget>[
      buildPrivacy(context),
      buildSecurity(context),
      buildAccountInfo(context)
      ]
    ), 
  );
  
  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
    title: 'Privacy',
    subtitle: '',
    leading: IconWidget(icon: Icons.lock, color: Colors.deepPurple,),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'),
  );

  Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
    title: 'Security',
    subtitle: '',
    leading: IconWidget(icon: Icons.security, color: Colors.deepPurple,),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'),
  );

  Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
    title: 'Account Information',
    subtitle: '',
    leading: IconWidget(icon: Icons.thumb_up, color: Colors.deepPurple,),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'),
  );
}