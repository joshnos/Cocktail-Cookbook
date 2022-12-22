import 'package:flutter/material.dart';

class FullScreenLayout extends StatelessWidget {
  final Widget child;
  const FullScreenLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: child,
    );
  }
}
