import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dash_n_dine/pages/general_stuff/home.dart';

class TextHelper extends StatefulWidget {
  @override
  _TextHelperState createState() => _TextHelperState();
}

class _TextHelperState extends State<TextHelper> {
  // Controllers for managing the text inputs
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _realnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late String _userID;

  // Function to handle account creation
  Future<bool> _createAccount() async {
    final userID = _userIDController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final email = _emailController.text;
    final realname = _realnameController.text;

    //validating input for user information
    if (username.isEmpty || password.isEmpty || email.isEmpty || realname.isEmpty) {
      _showDialog('Error', 'Please fill in all required fields.');
      return false;
    }

    // Validate the email address
    if (!EmailValidator.validate(email)) {
      _showDialog('Error', 'Please enter a valid email address.');
      return false;
    }

    //Checking password length
    if (password.length < 6) {
      _showDialog(
        'Error',
        'Password must be at least 6 characters long, with no special characters (accepted special characters: ! ? ).',
      );
      return false;
    }

    // DB stuff here
    // Check if account already exists
    bool accountExists = await _checkAccountExists(username, email, userID);
    if (accountExists) {
      _showDialog('Error', 'Username, email, or userID already exists.');
      return false; // Abort account creation
    }
    
    // Prepare the request body
    final body = {
      "userID": userID,
      "userEmail": email,
      "realName": realname,
      "username": username,
      "pw": password,
      "perms": "User"
    };

    // Submit data to the server
    final url = 'http://10.0.2.2:5000/api/User';
    final uri = Uri.parse(url);

    try {
      final response = await http.post(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json'},
      );

      // Show success or fail message based on status
      if (response.statusCode == 201) {
        _userID = userID;
        // Clear the input fields after a successful account creation
        _userIDController.text = '';
        _usernameController.text = '';
        _passwordController.text = '';
        _emailController.text = '';
        _realnameController.text = '';

        // Show success message
        showSuccessMessage('Account Created Successfully');
        return true;
      } else {
        // Show error message for failure
        showErrorMessage('Account Creation Failed: ${response.reasonPhrase}');
      }
    } catch (e) {
      showErrorMessage('An error occurred: $e');
    }
    return false;
  }

  String getUserID() => _userID; // Getter for userID

  // Success message display
  void showSuccessMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Error message display
  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up Page')),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //Real Name
              TextField(
                controller: _realnameController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                  ),
                ],
                decoration: InputDecoration(
                  labelText: 'Please enter your name',
                ),
              ),
              //username
              TextField(
                controller: _usernameController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
                  ),
                ],
                decoration: InputDecoration(labelText: 'Enter User Name'),
              ),

              //email
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: 'Enter Email'),
              ),

              //userID
              TextField(
                controller: _userIDController,
                decoration: InputDecoration(labelText: 'Enter userID (numbers only)'),
              ),

              //password
              TextField(
                controller: _passwordController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                    RegExp(r'[@#%^&*(),.":{}|<>]'),
                  ),
                ],
                obscureText: true, // Hides the text for password
                decoration: InputDecoration(labelText: 'Enter Password'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  bool success = await _createAccount(); // Submit data and wait for result
                  if (success) {
                    // Navigate to HomePage if successful
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //helper function to check for existing account (not working, not sure how to fix this without setting up various json files and editing the database, which I don't want to mess with)
  Future<bool> _checkAccountExists(String username, String email, String userID) async {
  final url = 'http://10.0.2.2:5000/api/User/check'; 
  final uri = Uri.parse(url);

  try {
    final response = await http.post(
      uri,
      body: jsonEncode({"username": username, "email": email, "userID": userID}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData['usernameExists'] || responseData['emailExists'] || responseData['idExists'];
    }
  } catch (e) {
    print('Error checking account existence: $e');
    return false;
  }

  return false; // Default to false if the status code isn't 200
}

  //Helper function to show a dialog (documentation on function https://api.flutter.dev/flutter/material/showDialog.html)
  void _showDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
