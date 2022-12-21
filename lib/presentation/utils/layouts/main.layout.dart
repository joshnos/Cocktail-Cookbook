import 'package:cocktail_coockbook/application/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  MainLayout({Key? key, required this.child}) : super(key: key);

  static const tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    /*BottomNavigationBarItem(
      icon: Icon(Icons.local_bar),
      label: 'Drinks',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.liquor),
      label: 'Ingredients',
    ),*/
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar:
          BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.index,
            items: tabs,
            onTap: (index) {
              if (index != state.index) {
                switch (index) {
                  case 0:
                    context
                        .read<BottomNavigationCubit>()
                        .getNavBarItem(NavbarItem.home);
                    Navigator.pushNamed(context, '/home');
                    break;
                  case 1:
                    context
                        .read<BottomNavigationCubit>()
                        .getNavBarItem(NavbarItem.search);
                    Navigator.pushNamed(context, '/search');
                    break;
                }
              }
            },
          );
        },
      ),
    );
  }
}
