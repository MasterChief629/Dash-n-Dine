import 'package:flutter/material.dart';
//import 'helpers/iconhelper.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(duration: 3, goToPage: WelcomePage())
  ));
}

class SplashPage extends StatefulWidget {
  final int duration;
  final Widget goToPage;

  const SplashPage({super.key, required this.goToPage, required this.duration});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: widget.duration), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => widget.goToPage),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Icon(Icons.favorite, color: Colors.white, size: 100),
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                child: Image.asset('assets/imgs/saints-hall-main-banner.jpg',
                fit: BoxFit.cover)
              )
            ),
            Center()
          ])
        )
    );
  }
}







