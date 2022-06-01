import 'package:flutter/material.dart';

class CustomTapDetector extends StatelessWidget {
  const CustomTapDetector(
      {Key? key, this.onTap, required this.child, this.radius = 6})
      : super(key: key);
  final Function()? onTap;
  final Widget child;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius),
        child: child,
        onTap: onTap,
      ),
    );
  }
}
