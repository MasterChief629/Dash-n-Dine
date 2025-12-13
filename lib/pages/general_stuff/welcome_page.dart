import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/pages/general_stuff/home.dart';
import 'package:flutter/material.dart';
import 'package:dash_n_dine/pages/user_stuff/user_create_account.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePagesState createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Positioned.fill(
              child: Opacity(
                opacity: 0.3,
                child: Image.asset(
                  IconFontHelper.MARYVILLE_LOGO,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //centers the logo
                  Center(
                    child: ClipOval(
                      child: Container(
                        width: 180,
                        height: 180,
                        color: Color(0xffFDFDFD),
                        child: Image.asset(IconFontHelper.LOGO),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 69,
                  ), //space inbewteen the logo and text (can change value to anything)
                  Text(
                    'Welcome!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ), //space inbewteen the Welcome! text and bottom text (can change value to anything)
                  //buttons (https://docs.flutter.dev/release/breaking-changes/buttons)
                  SizedBox(
                    height: 20,
                  ), //space inbewteen the logo and text (can change value to anything)
                  //login stuff
                  //username
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: usernameController,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'![@#%^&*(),.":{}|<>]'),
                        ),
                      ],
                      decoration: InputDecoration(
                        //filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(),
                        labelText: 'Enter User Name',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      controller: passwordController,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          RegExp(r'[@#%^&*(),.":{}|<>]'),
                        ),
                      ],
                      obscureText: true, // Hides the text for password
                      decoration: InputDecoration(
                        //filled: true,
                        fillColor: Colors.transparent,
                        border: OutlineInputBorder(),
                        labelText: 'Enter Password',
                      ),
                    ),
                  ),

                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(50),
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all(
                          Color(0xffFDFDFD),
                        ),
                        backgroundColor: WidgetStateProperty.all(
                          AppColors.DARK_RED,
                        ),
                      ),
                      onPressed: () {
                        // Validate username and password fields
                        if (usernameController.text.isEmpty ||
                            passwordController.text.isEmpty) {
                          showErrorMessage('Please enter all required fields.');
                        } else {
                          login();
                        }
                      },
                      child: Text('Login'),
                    ),
                  ),

                  //sign up button. Will redirect to sign up page on button press
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: AppColors.DARK_RED.withValues(
                            alpha: 0.2,
                          ),
                          highlightColor: AppColors.BRIGHT_RED.withValues(
                            alpha: 0.2,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserCreateAccount(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.transparent,
                              border: Border.all(
                                color: Color(0xffAF0F0F),
                                width: 4,
                              ),
                            ),
                            child: Text(
                              'Sign up',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xffAF0F0F),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Error message display
  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message, style: TextStyle(color: Colors.black)),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> login() async {
  final String username = usernameController.text;
  final String password = passwordController.text;

  // URL to fetch all user information
  final url = 'http://10.0.2.2:5000/api/User'; 
  final uri = Uri.parse(url);

  try {
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final userList = json['value'] as List;

      // Checking user credentials
      for (var user in userList) {
        if (user['username'] == username) {
          if (user['pw'] == password) {
            // Proceed to the home page upon successful login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            return;
          } else {
            showErrorMessage('Incorrect password.');
            return;
          }
        }
      }
      showErrorMessage('User not found.');
    } else {
      showErrorMessage('Failed to fetch user information: ${response.reasonPhrase}');
    }
  } catch (e) {
    showErrorMessage('An error occurred: $e');
  }
}

}
