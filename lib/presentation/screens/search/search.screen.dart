import 'package:flutter/material.dart';

import '../../utils/layouts/main.layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        appbar: AppBar(
          centerTitle: true,
          title: const Text(
            'Search',
          ),
        ),
        child: const Text('Search'));
  }
}
