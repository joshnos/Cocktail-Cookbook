import 'package:bloc/bloc.dart';
import 'package:cocktail_coockbook/domain/models/ingredient.model.dart';
import 'package:equatable/equatable.dart';

import '../../domain/repositories/drink_recipes.repository.dart';
import '../utils/enums/api_status.enum.dart';

part 'lookup_ingredient_state.dart';

class LookupIngredientCubit extends Cubit<LookupIngredientState> {
  final DrinkRecipesRepository repository;
  final String id;
  LookupIngredientCubit(this.repository, this.id)
      : super(const LookupIngredientState(status: ApiStatus.initial)) {
    getIngredientById();
  }

  Future<void> getIngredientById() async {
    emit(const LookupIngredientState(status: ApiStatus.loading));
    try {
      List<Ingredient> data = await repository.lookupIngredientById(id);
      emit(LookupIngredientState(data: data.first, status: ApiStatus.loaded));
    } catch (e) {
      emit(LookupIngredientState(
          status: ApiStatus.error, errorMessage: e.toString()));
    }
  }
}
