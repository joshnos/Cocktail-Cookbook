import 'package:bloc/bloc.dart';
import 'package:cocktail_coockbook/domain/models/drink.model.dart';
import 'package:cocktail_coockbook/domain/repositories/drink_recipes.repository.dart';
import 'package:equatable/equatable.dart';

import '../utils/enums/api_status.enum.dart';

part 'random_cocktail_state.dart';

class RandomCocktailCubit extends Cubit<RandomCocktailState> {
  final DrinkRecipesRepository repository;
  RandomCocktailCubit(this.repository)
      : super(const RandomCocktailState(status: ApiStatus.initial)) {
    getRandomDrink();
  }

  Future<void> getRandomDrink() async {
    emit(const RandomCocktailState(status: ApiStatus.loading));
    try {
      List<Drink> data = await repository.lookupRandomCocktail();
      emit(RandomCocktailState(data: data.first, status: ApiStatus.loaded));
    } catch (e) {
      emit(RandomCocktailState(
          status: ApiStatus.error, errorMessage: e.toString()));
    }
  }
}
