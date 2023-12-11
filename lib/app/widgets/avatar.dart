import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final double radius;
  final Widget? child;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const Avatar({
    super.key,
    this.radius = 26,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: radius * 0.9,
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        foregroundColor:
            foregroundColor ?? Theme.of(context).colorScheme.onPrimary,
        child: child,
      ),
    );
  }
}
