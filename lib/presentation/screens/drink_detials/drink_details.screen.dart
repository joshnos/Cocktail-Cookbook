import 'package:cocktail_coockbook/application/lookup_drink_by_id_cubit/lookup_drink_by_id_cubit.dart';
import 'package:cocktail_coockbook/domain/repositories/drink_recipes.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/route_arguments/drink_details.arguments.dart';
import 'drink_details.dart';

class DrinkDetailsScreen extends StatelessWidget {
  const DrinkDetailsScreen({Key? key}) : super(key: key);

  static const routeName = '/drinkDetails';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return BlocProvider(
      create: (_) => LookupDrinkByIdCubit(
        context.read<DrinkRecipesRepository>(),
        args.id,
      ),
      child: const DrinkDetails(),
    );
  }
}
