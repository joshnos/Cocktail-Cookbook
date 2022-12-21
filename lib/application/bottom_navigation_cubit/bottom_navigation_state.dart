part of 'bottom_navigation_cubit.dart';

enum NavbarItem { home, search }

class BottomNavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const BottomNavigationState({
    this.navbarItem = NavbarItem.home,
    this.index = 0,
  });

  @override
  List<Object> get props => [navbarItem, index];

  BottomNavigationState copyWith({
    NavbarItem? navbarItem,
    int? index,
  }) {
    return BottomNavigationState(
      navbarItem: navbarItem ?? this.navbarItem,
      index: index ?? this.index,
    );
  }
}
