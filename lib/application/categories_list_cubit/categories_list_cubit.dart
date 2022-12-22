import 'package:bloc/bloc.dart';
import 'package:cocktail_coockbook/domain/models/category.model.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/drink.model.dart';
import '../../domain/repositories/drink_recipes.repository.dart';
import '../utils/enums/api_status.enum.dart';

part 'categories_list_state.dart';

class CategoriesListCubit extends Cubit<CategoriesListState> {
  final DrinkRecipesRepository repository;
  CategoriesListCubit(this.repository)
      : super(
          const CategoriesListState(
            drinkListStatus: ApiStatus.initial,
            ingredientListStatus: ApiStatus.initial,
          ),
        ) {
    getGlassesList();
  }

  Future<void> getGlassesList() async {
    emit(state.copyWith(ingredientListStatus: ApiStatus.loading));
    try {
      List<Category> data = await repository.listCategories();
      emit(state.copyWith(
          filterList: data, ingredientListStatus: ApiStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> getDrinksByCategory(String name) async {
    emit(state.copyWith(drinkListStatus: ApiStatus.loading));
    try {
      List<Drink> data = await repository.filterCocktailsByCategory(name);
      emit(state.copyWith(
          drinksList: data, drinkListStatus: ApiStatus.loaded, selected: name));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }
}
