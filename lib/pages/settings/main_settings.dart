import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dash_n_dine/helpers/texthelper.dart';
import 'package:dash_n_dine/widgets/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
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
  _MainSettingsState createState() => _MainSettingsState();
}

class _MainSettingsState extends State<MainSettings> {
  //String ID = ''; //holds user id
  List<dynamic> users = []; // List to manage user data
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        //Display multiple widgets
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
          const SizedBox(height: 32),
          SettingsGroup(
            title: 'FEEDBACK',
            children: <Widget>[
              const SizedBox(height: 8),
              buildReportBug(context),
              buildSendFeedback(context),
            ],
          ),
        ],
      ),
    ),
    appBar: AppBar(),
  );

  //feel free to change the color of the circle, they are just placeholder colors for now
  Widget buildLogout() => SimpleSettingsTile(
    title: 'Logout',
    subtitle: '',
    leading: IconWidget(icon: Icons.logout, color: Colors.blueAccent),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'), //Log user out
  );

  Widget buildDeleteAccount() => SimpleSettingsTile(
    title: 'Delete Account',
    subtitle: '',
    leading: IconWidget(icon: Icons.delete, color: Colors.redAccent),
    onTap: () async {
      _showDeleteConfirmationDialog(); // Show dialog when tapped
    },
  );

  Widget buildReportBug(BuildContext context) => SimpleSettingsTile(
    title: 'Report a bug!',
    subtitle: '',
    leading: IconWidget(icon: Icons.bug_report, color: Colors.tealAccent),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'), //Not enough time to implement this, its just for show
  );

  Widget buildSendFeedback(BuildContext context) => SimpleSettingsTile(
    title: 'Send Feedback!',
    subtitle: '',
    leading: IconWidget(icon: Icons.thumb_up, color: Colors.deepPurple),
    //onTap:() => Utils.showSnackBar(context, 'Clicked Logout'), //Also just for show
  );

  Future<void> deleteByUserID(int userID) async {
    final url = 'http://10.0.2.2:5000/api/User/userID/$userID';
    final uri = Uri.parse(url);

    try {
      final response = await http.delete(uri);

      if (response.statusCode == 204) {
        setState(() {
          // Assuming you have a list of users, remove the deleted user
          users.removeWhere((user) => user['userID'] == userID);
        });
        showSuccessMessage('User deleted successfully.');
      } else {
        showErrorMessage('Unable to delete user: ${response.reasonPhrase}');
      }
    } catch (e) {
      showErrorMessage('An error occurred: $e');
    }
  }

  // Display success message
  void showSuccessMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Display error message
  void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.red,
      ),
    );
  }

  //dialog box (popup thingy) to prompt user for ID
  Future<void> _showDeleteConfirmationDialog() async {
    String inputID = ''; // to hold the user ID input

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Please enter your User ID to confirm account deletion:'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  inputID = value; // capture input
                },
                decoration: InputDecoration(hintText: 'User ID'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (inputID.isNotEmpty) {
                  int userIDToDelete = int.tryParse(inputID) ?? -1;
                  if (userIDToDelete >= 0) {
                    deleteByUserID(userIDToDelete);
                    Navigator.of(context).pop();
                  } else {
                    showErrorMessage('Invalid User ID');
                  }
                }
              },
              child: Text('Delete Account'),
            ),
          ],
        );
      },
    );
  }
}
