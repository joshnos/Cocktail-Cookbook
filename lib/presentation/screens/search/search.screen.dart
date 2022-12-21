import 'package:flutter/material.dart';

import '../../utils/layouts/main.layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(child: const Text('Search'));
  }
}
