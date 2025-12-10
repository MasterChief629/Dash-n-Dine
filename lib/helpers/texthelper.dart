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
  final TextEditingController _realnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Function to handle account creation
  void _createAccount() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final email = _emailController.text;
    final realname = _realnameController.text;
    
    //validating input for username and password
    if (username.isEmpty || password.isEmpty || email.isEmpty || realname.isEmpty) {
      _showDialog('Error', 'Please fill in all required fields.');
      return;
    }

// Validate the email address
    if (!EmailValidator.validate(email)) {
      _showDialog('Error', 'Please enter a valid email address.');
      return;
    }

    //Checking password length
    if (password.length < 6) {
      _showDialog('Error', 'Password must be at least 6 characters long, with no special characters (accepted special characters: ! ? ).');
      return;
    }

    //call DB here (not sure how to do this part, may need help figuring this out)
    

    //Navigate to home page after successful account creation
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
      ),

      
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
                      RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
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
                      RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Enter User Name',
                ),
              ),

              //email
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                ),
              ),

              //password
              TextField(
                controller: _passwordController,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(
                      RegExp(r'[@#%^&*(),.":{}|<>]')),
                ],
                obscureText: true,  // Hides the text for password
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _createAccount,
                child: Text('Create Account'),
              ),
            ],
          ),
        ),
      ),
    );
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
                child: Text('OK'))
            ],
          );
        },
      );
    }

}