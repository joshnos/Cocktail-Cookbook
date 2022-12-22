import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/drink.model.dart';
import '../../domain/repositories/drink_recipes.repository.dart';
import '../utils/enums/api_status.enum.dart';

part 'search_by_name_state.dart';

class SearchByNameCubit extends Cubit<SearchByNameState> {
  final DrinkRecipesRepository repository;
  SearchByNameCubit(this.repository)
      : super(
          const SearchByNameState(
            drinkListStatus: ApiStatus.initial,
          ),
        ) {
    getDrinksByName('');
  }

  Future<void> getDrinksByName(String name) async {
    emit(state.copyWith(drinkListStatus: ApiStatus.loading));
    try {
      List<Drink> data = await repository.searchCocktailByName(name);
      emit(
        state.copyWith(
            drinksList: data,
            drinkListStatus: ApiStatus.loaded,
            searchKey: name),
      );
    } catch (e) {
      emit(state.copyWith(
          drinkListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> clearSearch() async {
    emit(state.copyWith(drinkListStatus: ApiStatus.loading));
    try {
      List<Drink> data = await repository.searchCocktailByName('');
      emit(
        state.copyWith(
            drinksList: data, drinkListStatus: ApiStatus.loaded, searchKey: ''),
      );
    } catch (e) {
      emit(state.copyWith(
          drinkListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }
}
