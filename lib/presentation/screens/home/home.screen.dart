import 'package:cocktail_coockbook/application/random_cocktail_cubit/random_cocktail_cubit.dart';
import 'package:cocktail_coockbook/domain/repositories/drink_recipes.repository.dart';
import 'package:cocktail_coockbook/presentation/screens/home/home_menu.dart';
import 'package:cocktail_coockbook/presentation/utils/layouts/main.layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cocktail Coockbook',
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RandomCocktailCubit(
              context.read<DrinkRecipesRepository>(),
            ),
          ),
        ],
        child: const HomeMenu(),
      ),
    );
  }
}
