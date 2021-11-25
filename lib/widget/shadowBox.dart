import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget(
      {Key? key,
      required this.child,
      required this.elevation,
      required this.color})
      : super(key: key);
  final Widget child;
  final double elevation;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.black,
      elevation: 25,
      child: this.child,
    );
  }
}
