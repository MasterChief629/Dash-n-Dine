//says "is marked as immutable". Still runs fine as far as I can tell. If any issues pop up, I'll fix them.
import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {
  final Color? color;
  final double? size;
  final String? iconName;

  // Default constructor
  const IconFont({super.key, this.color, this.size, this.iconName});

  @override
  Widget build(BuildContext context) {
    return Text(
      iconName ?? '', // Provide a default value in case iconName is null
      style: TextStyle(
        color: color ?? Colors.black, // Provide a default color
        fontSize: size ?? 24.0, // Provide a default size
        fontFamily: 'dash_n_dine_font', // Placeholder for now
      ),
    );
  }
}

/*
class IconFont extends StatelessWidget {
 final Color color;
 final double size;
 final String iconName;

  IconFont({ this.color, this.size, this.iconName});

  @override
  Widget build(BuildContext context) {
    return Text(
      iconName,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontFamily: 'dash_n_dine_font', //Place holder for now
      ),
    );
  }
}
*/