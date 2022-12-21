import 'package:cocktail_coockbook/presentation/utils/layouts/main.layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(child: const Text('Home'));
  }
}
