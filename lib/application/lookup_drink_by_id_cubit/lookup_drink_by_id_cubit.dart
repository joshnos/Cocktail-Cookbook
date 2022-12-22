import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/models/drink.model.dart';
import '../../domain/repositories/drink_recipes.repository.dart';
import '../utils/enums/api_status.enum.dart';

part 'lookup_drink_by_id_state.dart';

class LookupDrinkByIdCubit extends Cubit<LookupDrinkByIdState> {
  final DrinkRecipesRepository repository;
  final String id;
  LookupDrinkByIdCubit(this.repository, this.id)
      : super(const LookupDrinkByIdState(status: ApiStatus.initial)) {
    getDrinkById();
  }

  Future<void> getDrinkById() async {
    emit(const LookupDrinkByIdState(status: ApiStatus.loading));
    try {
      List<Drink> data = await repository.lookupCocktailById(id);
      emit(LookupDrinkByIdState(data: data.first, status: ApiStatus.loaded));
    } catch (e) {
      emit(LookupDrinkByIdState(
          status: ApiStatus.error, errorMessage: e.toString()));
    }
  }

  String getIngredientImageUrl(String name) {
    return repository.ingredientThumbnail(name);
  }
}
