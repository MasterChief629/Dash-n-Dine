import 'package:flutter/material.dart';

//this is a simple reusable widget
//all it does is allows for quickly creating circle icons
class IconWidget extends StatelessWidget{
  final IconData icon;
  final Color color;

  const IconWidget({
    Key? key,
    required this.icon,
    required this.color,
  }) : super(key : key);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color,
    ),
    child: Icon(icon, color: Colors.white),
  );
}