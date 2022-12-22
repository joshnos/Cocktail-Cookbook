import 'package:cocktail_coockbook/application/search_by_name_cubit/search_by_name_cubit.dart';
import 'package:cocktail_coockbook/domain/repositories/drink_recipes.repository.dart';
import 'package:cocktail_coockbook/presentation/screens/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/layouts/main.layout.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appbar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search by name',
        ),
      ),
      child: BlocProvider(
        create: (context) =>
            SearchByNameCubit(context.read<DrinkRecipesRepository>()),
        child: const Search(),
      ),
    );
  }
}
