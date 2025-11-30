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
import 'package:dash_n_dine/pages/settings/account_page.dart';
import 'package:dash_n_dine/pages/settings/notifications_page.dart';

//Main settings page

//Main things it has
/*
  - button for user settings (redirect to user settings page)
  - button for account settings (redirect to account settings | this is different from user settings)
  - account settings will have a button for changing the user's information (credit card/maryville wallet (obviously, we cant do this one, so we will probably have to make up fake accounts for this)) , and adding/removing credit cards/maryville wallet
*/

//class
class MainSettings extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<MainSettings> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: ListView( //Display multiple widgets
        padding: EdgeInsets.all(24),
        children: [
          SettingsGroup(
            title: 'GENERAL',
            children: <Widget>[
              AccountPage(),
              NotificationsPage(),
              buildLogout(),
              buildDeleteAccount(),
            ],
          ),
          const SizedBox(height: 32,),
          SettingsGroup(
            title: 'FEEDBACK',
            children: <Widget>[
              const SizedBox(height: 8,),
              buildReportBug(context),
              buildSendFeedback(context),
            ],
          )
        ],
      ),
    ),
    appBar: AppBar(),
  );
  //feel free to change the color of the circle, they are just placeholder colors for now
  Widget buildLogout() => SimpleSettingsTile(
    title: 'Logout',
    subtitle: '',
    leading: IconWidget(icon: Icons.logout, color: Colors.blueAccent,),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'),
  );
  Widget buildDeleteAccount() => SimpleSettingsTile(
    title: 'Delete Account',
    subtitle: '',
    leading: IconWidget(icon: Icons.logout, color: Colors.redAccent,),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Delete Account'),
  );
  Widget buildReportBug(BuildContext context) => SimpleSettingsTile(
    title: 'Report a bug!',
    subtitle: '',
    leading: IconWidget(icon: Icons.bug_report, color: Colors.tealAccent,),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'),
  );
  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
    title: 'Send Feedback!',
    subtitle: '',
    leading: IconWidget(icon: Icons.thumb_up, color: Colors.deepPurple,),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'),
  );
}