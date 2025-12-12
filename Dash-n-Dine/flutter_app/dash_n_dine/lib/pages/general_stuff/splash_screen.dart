import 'package:flutter/material.dart';
import 'package:dash_n_dine/helpers/iconhelper.dart';
import 'package:dash_n_dine/widgets/iconfont.dart';

//says "is marked as immutable". Still runs fine as far as I can tell. If any issues pop up, I'll fix them.
class SplashScreen extends StatelessWidget {
  final int? duration; //how long the splash screen stays on the screen
  final Widget? goToPage;

  SplashScreen({super.key, this.goToPage, this.duration});

  @override
  Widget build(BuildContext context) {
    final int displayDuration =
        duration ?? 2; //if no specified value, default to 2 seconds
    //this holds for
    Future.delayed(Duration(seconds: displayDuration), () {
      if (goToPage != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => goToPage!), //! after goToPage is a null assertion operator (long documentation: https://dart.dev/null-safety/understanding-null-safety)) may throw NoSuchMethodError if goToPage is null
        );
      }
    });

    return Scaffold(
      body: Container(
        color: Color(0xffE02424),
        child: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
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
           ],
          ),
        ),
      ),
    );
  }
}