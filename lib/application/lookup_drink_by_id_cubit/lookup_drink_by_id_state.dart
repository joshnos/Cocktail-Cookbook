part of 'lookup_drink_by_id_cubit.dart';

class LookupDrinkByIdState extends Equatable {
  final Drink? data;
  final ApiStatus status;
  final String? errorMessage;

  const LookupDrinkByIdState({
    this.data,
    this.status = ApiStatus.initial,
    this.errorMessage,
  });

  @override
  List<Object> get props => [status];

  LookupDrinkByIdState copyWith({
    Drink? data,
    ApiStatus? status,
    String? errorMessage,
  }) {
    return LookupDrinkByIdState(
      data: data,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }
}
