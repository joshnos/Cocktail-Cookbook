import 'package:cocktail_coockbook/application/glasses_list_cubit/glasses_list_cubit.dart';
import 'package:cocktail_coockbook/presentation/screens/glass/drinks_by_glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/drink_recipes.repository.dart';
import '../../utils/layouts/common.layout.dart';

class GlassScreen extends StatelessWidget {
  const GlassScreen({Key? key}) : super(key: key);

  static const routeName = '/drinkByGlass';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GlassesListCubit(context.read<DrinkRecipesRepository>()),
      child: CommonLayout(
        appbar: AppBar(
          title: const Text('Drinks By Glass'),
          centerTitle: true,
        ),
        child: const DrinksByGlass(),
      ),
    );
  }
}
