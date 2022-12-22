import 'package:flutter/material.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget appbar;
  const CommonLayout({Key? key, required this.child, required this.appbar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: child,
      ),
    );
  }
}
