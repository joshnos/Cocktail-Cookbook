import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(const BottomNavigationState());

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(
            const BottomNavigationState(navbarItem: NavbarItem.home, index: 0));
        break;
      case NavbarItem.search:
        emit(const BottomNavigationState(
            navbarItem: NavbarItem.search, index: 1));
        break;
    }
  }
}
