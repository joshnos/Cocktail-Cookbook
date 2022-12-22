import 'package:cocktail_coockbook/application/ingredients_list_cubit/ingredients_list_cubit.dart';
import 'package:cocktail_coockbook/application/utils/enums/api_status.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/drink.model.dart';
import '../../utils/route_arguments/drink_details.arguments.dart';
import '../drink_detials/drink_details.screen.dart';

class DrinksByIngredient extends StatelessWidget {
  const DrinksByIngredient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<IngredientsListCubit, IngredientsListState>(
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Column(
          children: const [
            Text(
              'Select an ingredient',
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
    return BlocBuilder<IngredientsListCubit, IngredientsListState>(
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
                children: state.ingredientList!.map(
                  (e) {
                    return FilterChip(
                      label: Text(e.strIngredient1 ?? 'Ingredient'),
                      selected: state.selected == e.strIngredient1,
                      onSelected: (value) {
                        if (value) {
                          context
                              .read<IngredientsListCubit>()
                              .getDrinksByIngredient(e.strIngredient1!);
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
    return BlocBuilder<IngredientsListCubit, IngredientsListState>(
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
                        .map((e) => _DrinkCard(
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

class _DrinkCard extends StatelessWidget {
  final Drink drink;
  const _DrinkCard({Key? key, required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(
                drink.strDrinkThumb ?? 'https://dummyimage.com/300'),
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.colorBurn,
            ),
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                DrinkDetailsScreen.routeName,
                arguments: ScreenArguments(drink.idDrink!),
              );
            },
            borderRadius: BorderRadius.circular(20.0),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                drink.strDrink ?? 'Drink',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
