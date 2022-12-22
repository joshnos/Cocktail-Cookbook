import 'package:cocktail_coockbook/application/ingredients_list_cubit/ingredients_list_cubit.dart';
import 'package:cocktail_coockbook/domain/repositories/drink_recipes.repository.dart';
import 'package:cocktail_coockbook/presentation/screens/ingredients/drinks_by_ingredient.dart';
import 'package:cocktail_coockbook/presentation/utils/layouts/common.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IngredientsScreen extends StatelessWidget {
  const IngredientsScreen({Key? key}) : super(key: key);

  static const routeName = '/drinkByIngredients';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          IngredientsListCubit(context.read<DrinkRecipesRepository>()),
      child: CommonLayout(
          appbar: AppBar(
            title: const Text('Drinks By Ingredient'),
            centerTitle: true,
          ),
          child: const DrinksByIngredient()),
    );
  }
}
