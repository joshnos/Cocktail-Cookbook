import 'package:cocktail_coockbook/application/alcoholic_list_cubit/alcoholic_list_cubit.dart';
import 'package:cocktail_coockbook/application/glasses_list_cubit/glasses_list_cubit.dart';
import 'package:cocktail_coockbook/application/utils/enums/api_status.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/widgets/drink_card.widget.dart';

class DrinksByAlcoholic extends StatelessWidget {
  const DrinksByAlcoholic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlcoholicListCubit, AlcoholicListState>(
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text(
              'Select a filter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            _IngredientWrap(),
            Divider(),
            _DrinksList(),
          ],
        ),
      ),
    );
  }
}

class _IngredientWrap extends StatelessWidget {
  const _IngredientWrap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlcoholicListCubit, AlcoholicListState>(
      buildWhen: (previous, current) =>
          previous.ingredientListStatus != current.ingredientListStatus ||
          previous.selected != current.selected,
      builder: (context, state) {
        if (state.ingredientListStatus == ApiStatus.loaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .2,
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 5.0,
                children: state.filterList!.map(
                  (e) {
                    return FilterChip(
                      label: Text(e.strAlcoholic ?? 'Alcoholic'),
                      selected: state.selected == e.strAlcoholic,
                      onSelected: (value) {
                        if (value) {
                          context
                              .read<AlcoholicListCubit>()
                              .getDrinksByAlcoholic(e.strAlcoholic!);
                        }
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}

class _DrinksList extends StatelessWidget {
  const _DrinksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlcoholicListCubit, AlcoholicListState>(
      builder: (context, state) {
        if (state.drinkListStatus == ApiStatus.error) {
          return const Center(
            child: Text('There was an error retrieving your drinks list'),
          );
        }
        if (state.drinkListStatus == ApiStatus.loading) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .3 + 53,
              child: const Center(child: CircularProgressIndicator()));
        }
        if (state.drinkListStatus == ApiStatus.loaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: state.drinksList!
                        .map((e) => DrinkCard(
                              drink: e,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        }
        return SizedBox(
          height: MediaQuery.of(context).size.height * .7,
          child: ListView(),
        );
      },
    );
  }
}
