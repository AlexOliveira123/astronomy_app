import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double height;
  final double width;

  const BackgroundGradient({
    this.child,
    this.padding,
    this.height,
    this.margin,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(width: 0),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [Colors.black, Color.fromRGBO(0, 24, 57, 1)],
        ),
      ),
      child: child,
    );
  }
}
