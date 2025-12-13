import 'package:flutter/material.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/helpers/texthelper.dart';

class UserCreateAccount extends StatelessWidget {
  const UserCreateAccount({Key? key}) : super(key: key);
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

            //User will create account here (using texthelper widget)
            Center(
              child: TextHelper(),
            ),
          ],
        )
      )
    );
  }
}


/*
REQUIRED
userID
email
realname
username
password
*/