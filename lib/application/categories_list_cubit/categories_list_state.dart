part of 'categories_list_cubit.dart';

class CategoriesListState extends Equatable {
  final List<Drink>? drinksList;
  final List<Category>? filterList;
  final String? selected;
  final ApiStatus drinkListStatus;
  final ApiStatus ingredientListStatus;
  final String? errorMessage;

  const CategoriesListState({
    this.drinksList,
    this.filterList,
    this.selected,
    this.drinkListStatus = ApiStatus.initial,
    this.ingredientListStatus = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [drinkListStatus, ingredientListStatus];

  CategoriesListState copyWith({
    List<Drink>? drinksList,
    List<Category>? filterList,
    String? selected,
    ApiStatus? drinkListStatus,
    ApiStatus? ingredientListStatus,
    String? errorMessage,
  }) {
    return CategoriesListState(
      drinksList: drinksList ?? this.drinksList,
      filterList: filterList ?? this.filterList,
      selected: selected ?? this.selected,
      drinkListStatus: drinkListStatus ?? this.drinkListStatus,
      ingredientListStatus: ingredientListStatus ?? this.ingredientListStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
