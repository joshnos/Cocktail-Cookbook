import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/alcoholicFilter.model.dart';
import '../../domain/models/drink.model.dart';
import '../../domain/repositories/drink_recipes.repository.dart';
import '../utils/enums/api_status.enum.dart';

part 'alcoholic_list_state.dart';

class AlcoholicListCubit extends Cubit<AlcoholicListState> {
  final DrinkRecipesRepository repository;
  AlcoholicListCubit(this.repository)
      : super(
          const AlcoholicListState(
            drinkListStatus: ApiStatus.initial,
            ingredientListStatus: ApiStatus.initial,
          ),
        ) {
    getGlassesList();
  }

  Future<void> getGlassesList() async {
    emit(state.copyWith(ingredientListStatus: ApiStatus.loading));
    try {
      List<AlcoholicFilter> data = await repository.listAlcoholicFilters();
      emit(state.copyWith(
          filterList: data, ingredientListStatus: ApiStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }

  Future<void> getDrinksByAlcoholic(String name) async {
    emit(state.copyWith(drinkListStatus: ApiStatus.loading));
    try {
      List<Drink> data = await repository.filterCocktailsByAlcoholic(name);
      emit(state.copyWith(
          drinksList: data, drinkListStatus: ApiStatus.loaded, selected: name));
    } catch (e) {
      emit(state.copyWith(
          ingredientListStatus: ApiStatus.error, errorMessage: e.toString()));
    }
  }
}
