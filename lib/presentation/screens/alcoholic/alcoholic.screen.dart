import 'package:cocktail_coockbook/application/alcoholic_list_cubit/alcoholic_list_cubit.dart';
import 'package:cocktail_coockbook/presentation/screens/alcoholic/drinks_by_alcoholic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/drink_recipes.repository.dart';
import '../../utils/layouts/common.layout.dart';

class AlcoholicScreen extends StatelessWidget {
  const AlcoholicScreen({Key? key}) : super(key: key);

  static const routeName = '/drinkByAlcoholic';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AlcoholicListCubit(context.read<DrinkRecipesRepository>()),
      child: CommonLayout(
        appbar: AppBar(
          title: const Text('Drinks By Alcoholic'),
          centerTitle: true,
        ),
        child: const DrinksByAlcoholic(),
      ),
    );
  }
}
