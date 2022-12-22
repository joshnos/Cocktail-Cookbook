part of 'alcoholic_list_cubit.dart';

class AlcoholicListState extends Equatable {
  final List<Drink>? drinksList;
  final List<AlcoholicFilter>? filterList;
  final String? selected;
  final ApiStatus drinkListStatus;
  final ApiStatus ingredientListStatus;
  final String? errorMessage;

  const AlcoholicListState({
    this.drinksList,
    this.filterList,
    this.selected,
    this.drinkListStatus = ApiStatus.initial,
    this.ingredientListStatus = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [drinkListStatus, ingredientListStatus];

  AlcoholicListState copyWith({
    List<Drink>? drinksList,
    List<AlcoholicFilter>? filterList,
    String? selected,
    ApiStatus? drinkListStatus,
    ApiStatus? ingredientListStatus,
    String? errorMessage,
  }) {
    return AlcoholicListState(
      drinksList: drinksList ?? this.drinksList,
      filterList: filterList ?? this.filterList,
      selected: selected ?? this.selected,
      drinkListStatus: drinkListStatus ?? this.drinkListStatus,
      ingredientListStatus: ingredientListStatus ?? this.ingredientListStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
