import 'package:bloc/bloc.dart';
import 'package:cocktail_coockbook/domain/models/glass.model.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/drink.model.dart';
import '../../domain/repositories/drink_recipes.repository.dart';
import '../utils/enums/api_status.enum.dart';

part 'glasses_list_state.dart';

class GlassesListCubit extends Cubit<GlassesListState> {
  final DrinkRecipesRepository repository;
  GlassesListCubit(this.repository)
      : super(
          const GlassesListState(
            drinkListStatus: ApiStatus.initial,
            ingredientListStatus: ApiStatus.initial,
          ),
        ) {
    getGlassesList();
  }

  Future<void> getGlassesList() async {
    emit(state.copyWith(ingredientListStatus: ApiStatus.loading));
    try {
      List<Glass> data = await repository.listGlasses();
      emit(state.copyWith(
          ingredientList: data, ingredientListStatus: ApiStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> getDrinksByGlass(String name) async {
    emit(state.copyWith(drinkListStatus: ApiStatus.loading));
    try {
      List<Drink> data = await repository.filterCocktailsByGlass(name);
      emit(state.copyWith(
          drinksList: data, drinkListStatus: ApiStatus.loaded, selected: name));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }
}
