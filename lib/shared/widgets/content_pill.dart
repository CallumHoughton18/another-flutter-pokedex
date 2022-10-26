import 'package:flutter/material.dart';

class ContentPill extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  const ContentPill(this.child, {super.key, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Material(
        color: Colors.transparent,
        child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            decoration: ShapeDecoration(
              shape: const StadiumBorder(),
              color: backgroundColor,
            ),
            child: child),
      ),
    );
  }
}
