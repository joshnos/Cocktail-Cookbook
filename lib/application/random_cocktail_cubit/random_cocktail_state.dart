part of 'random_cocktail_cubit.dart';

class RandomCocktailState extends Equatable {
  final Drink? data;
  final ApiStatus status;
  final String? errorMessage;

  const RandomCocktailState({
    this.data,
    this.status = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [status];

  RandomCocktailState copyWith({
    Drink? data,
    ApiStatus? status,
    String? errorMessage,
  }) {
    return RandomCocktailState(
      data: data,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
