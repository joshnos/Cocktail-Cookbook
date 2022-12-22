import 'package:bloc/bloc.dart';
import 'package:cocktail_coockbook/domain/models/ingredientName.model.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/drink.model.dart';
import '../../domain/repositories/drink_recipes.repository.dart';
import '../utils/enums/api_status.enum.dart';

part 'ingredients_list_state.dart';

class IngredientsListCubit extends Cubit<IngredientsListState> {
  final DrinkRecipesRepository repository;
  IngredientsListCubit(this.repository)
      : super(
          const IngredientsListState(
            drinkListStatus: ApiStatus.initial,
            ingredientListStatus: ApiStatus.initial,
          ),
        ) {
    getIngredientsList();
  }

  Future<void> getIngredientsList() async {
    emit(state.copyWith(ingredientListStatus: ApiStatus.loading));
    try {
      List<IngredientName> data = await repository.listIngredients();
      emit(state.copyWith(
          ingredientList: data, ingredientListStatus: ApiStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> getDrinksByIngredient(String name) async {
    emit(state.copyWith(drinkListStatus: ApiStatus.loading));
    try {
      List<Drink> data = await repository.searchCocktailsByIngredient(name);
      emit(state.copyWith(
          drinksList: data, drinkListStatus: ApiStatus.loaded, selected: name));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }
}
