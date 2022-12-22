part of 'lookup_ingredient_cubit.dart';

class LookupIngredientState extends Equatable {
  final Ingredient? data;
  final ApiStatus status;
  final String? errorMessage;

  const LookupIngredientState({
    this.data,
    this.status = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [status];

  LookupIngredientState copyWith({
    Ingredient? data,
    ApiStatus? status,
    String? errorMessage,
  }) {
    return LookupIngredientState(
      data: data,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
