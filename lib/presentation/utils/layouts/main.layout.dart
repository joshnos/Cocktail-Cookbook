import 'package:cocktail_coockbook/application/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget appbar;
  const MainLayout({Key? key, required this.child, required this.appbar})
      : super(key: key);

  static const tabs = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: child,
      ),
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
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    );
                    break;
                  case 1:
                    context
                        .read<BottomNavigationCubit>()
                        .getNavBarItem(NavbarItem.search);
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/search',
                      (route) => false,
                    );
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
