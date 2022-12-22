part of 'glasses_list_cubit.dart';

class GlassesListState extends Equatable {
  final List<Drink>? drinksList;
  final List<Glass>? ingredientList;
  final String? selected;
  final ApiStatus drinkListStatus;
  final ApiStatus ingredientListStatus;
  final String? errorMessage;

  const GlassesListState({
    this.drinksList,
    this.ingredientList,
    this.selected,
    this.drinkListStatus = ApiStatus.initial,
    this.ingredientListStatus = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [drinkListStatus, ingredientListStatus];

  GlassesListState copyWith({
    List<Drink>? drinksList,
    List<Glass>? ingredientList,
    String? selected,
    ApiStatus? drinkListStatus,
    ApiStatus? ingredientListStatus,
    String? errorMessage,
  }) {
    return GlassesListState(
      drinksList: drinksList ?? this.drinksList,
      ingredientList: ingredientList ?? this.ingredientList,
      selected: selected ?? this.selected,
      drinkListStatus: drinkListStatus ?? this.drinkListStatus,
      ingredientListStatus: ingredientListStatus ?? this.ingredientListStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
