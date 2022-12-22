import 'package:cocktail_coockbook/application/alcoholic_list_cubit/alcoholic_list_cubit.dart';
import 'package:cocktail_coockbook/application/categories_list_cubit/categories_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/drink_recipes.repository.dart';
import '../../utils/layouts/common.layout.dart';
import 'drinks_by_category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  static const routeName = '/drinkByCategory';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoriesListCubit(context.read<DrinkRecipesRepository>()),
      child: CommonLayout(
        appbar: AppBar(
          title: const Text('Drinks By Category'),
          centerTitle: true,
        ),
        child: const DrinksByCategory(),
      ),
    );
  }
}
