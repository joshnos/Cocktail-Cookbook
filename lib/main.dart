import 'package:cocktail_coockbook/application/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:cocktail_coockbook/presentation/screens/home/home.screen.dart';
import 'package:cocktail_coockbook/presentation/screens/search/search.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'presentation/utils/layouts/main.layout.dart';
import 'presentation/utils/theme/color_schemes.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const AppView();
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);
  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail Recipes',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      navigatorKey: _navigatorKey,
      routes: {
        '/home': (context) => const HomeScreen(),
        '/search': (context) => const SearchScreen(),
      },
      initialRoute: '/home',
      builder: (context, child) {
        return BlocProvider(
          create: (_) => BottomNavigationCubit(),
          child: child,
        );
      },
    );
  }
}
