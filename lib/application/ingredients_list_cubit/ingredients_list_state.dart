part of 'ingredients_list_cubit.dart';

class IngredientsListState extends Equatable {
  final List<Drink>? drinksList;
  final List<IngredientName>? ingredientList;
  final String? selected;
  final ApiStatus drinkListStatus;
  final ApiStatus ingredientListStatus;
  final String? errorMessage;

  const IngredientsListState({
    this.drinksList,
    this.ingredientList,
    this.selected,
    this.drinkListStatus = ApiStatus.initial,
    this.ingredientListStatus = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [drinkListStatus, ingredientListStatus];

  IngredientsListState copyWith({
    List<Drink>? drinksList,
    List<IngredientName>? ingredientList,
    String? selected,
    ApiStatus? drinkListStatus,
    ApiStatus? ingredientListStatus,
    String? errorMessage,
  }) {
    return IngredientsListState(
      drinksList: drinksList ?? this.drinksList,
      ingredientList: ingredientList ?? this.ingredientList,
      selected: selected ?? this.selected,
      drinkListStatus: drinkListStatus ?? this.drinkListStatus,
      ingredientListStatus: ingredientListStatus ?? this.ingredientListStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
