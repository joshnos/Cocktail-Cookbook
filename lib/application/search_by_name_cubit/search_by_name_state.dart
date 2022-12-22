part of 'search_by_name_cubit.dart';

class SearchByNameState extends Equatable {
  final List<Drink> drinksList;
  final String? searchKey;
  final ApiStatus drinkListStatus;
  final String? errorMessage;

  const SearchByNameState({
    this.drinksList = const [],
    this.searchKey,
    this.drinkListStatus = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [drinkListStatus];

  SearchByNameState copyWith({
    List<Drink>? drinksList,
    String? searchKey,
    ApiStatus? drinkListStatus,
    String? errorMessage,
  }) {
    return SearchByNameState(
      drinksList: drinksList ?? this.drinksList,
      searchKey: searchKey ?? this.searchKey,
      drinkListStatus: drinkListStatus ?? this.drinkListStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
