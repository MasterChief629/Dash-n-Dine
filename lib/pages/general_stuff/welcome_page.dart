import 'package:dash_n_dine/helpers/appcolors.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/pages/general_stuff/home.dart';
import 'package:dash_n_dine/widgets/iconfont.dart';
import 'package:flutter/material.dart';
import 'package:dash_n_dine/pages/user_stuff/user_create_account.dart';
import 'package:dash_n_dine/helpers/texthelper.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  final String realname = '';
  final String email = '';

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
                  Text(
                    'REPLACE WITH LOGIN/SIGN UP',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                      fontWeight: FontWeight.w200,
                    ),
                  ),

                  //buttons (https://docs.flutter.dev/release/breaking-changes/buttons)
                  SizedBox(
                    height: 20,
                  ), //space inbewteen the logo and text (can change value to anything)

                  Padding(
                    padding: const EdgeInsets.all(50),
                    //login button. Will redirect to home page on button press
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: WidgetStateProperty.all<Color>(
                          Color(0xffFDFDFD),
                        ),
                        backgroundColor: WidgetStateProperty.all<Color>(
                          AppColors.DARK_RED,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(realname: '', email: '',)),
                        );
                      },
                      child: Text('Login'), //placeholder text
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
                          splashColor: AppColors.DARK_RED.withValues(alpha: 0.2),
                          highlightColor: AppColors.BRIGHT_RED.withValues(alpha: 0.2),
                          onTap: () {
                            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => UserCreateAccount()),
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
}
