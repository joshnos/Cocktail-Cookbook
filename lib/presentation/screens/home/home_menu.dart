import 'package:cocktail_coockbook/application/random_cocktail_cubit/random_cocktail_cubit.dart';
import 'package:cocktail_coockbook/presentation/screens/ingredients/ingredients.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/utils/enums/api_status.enum.dart';
import '../../utils/route_arguments/drink_details.arguments.dart';
import '../drink_detials/drink_details.screen.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<RandomCocktailCubit, RandomCocktailState>(
          listener: (context, state) {},
        )
      ],
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _BoldText(text: 'Raise a glass to endless drink options'),
              const SizedBox(height: 15),
              const _DrinkCard(),
              const SizedBox(height: 10),
              const _LookUpRandomButton(),
              const SizedBox(height: 15),
              const _BoldText(text: 'Search drinks by:'),
              const SizedBox(height: 10),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: (1 / .5),
                children: const [
                  _FilterCard(
                    label: 'Glass',
                    filterKey: 'hasPetWalking',
                    icon: Icons.local_bar,
                  ),
                  _FilterCard(
                    label: 'Alcoholic',
                    filterKey: 'hasPetWalking',
                    icon: Icons.liquor,
                  ),
                  _FilterCard(
                    label: 'Category',
                    filterKey: 'hasPetWalking',
                    icon: Icons.list,
                  ),
                  _FilterCard(
                    label: 'Ingredients',
                    filterKey: 'ingredient',
                    icon: Icons.menu_book,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BoldText extends StatelessWidget {
  final String text;
  const _BoldText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _DrinkCard extends StatelessWidget {
  const _DrinkCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomCocktailCubit, RandomCocktailState>(
      builder: (context, state) {
        if (state.status == ApiStatus.error) {
          return const Center(
            child: Text('There was an error retrieving your drink'),
          );
        }
        if (state.status == ApiStatus.loading) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * .3 + 53,
              child: const Center(child: CircularProgressIndicator()));
        }
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * .3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(
                  state.data!.strDrinkThumb ?? 'https://dummyimage.com/300'),
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
                  arguments: ScreenArguments(state.data!.idDrink!),
                );
              },
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  state.data!.strDrink ?? 'Random drink',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _LookUpRandomButton extends StatelessWidget {
  const _LookUpRandomButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RandomCocktailCubit, RandomCocktailState>(
      builder: (context, state) {
        if (state.status == ApiStatus.loading) {
          return Container();
        }
        return ElevatedButton(
          key: const Key('lookUpRandomButton_raisedButton'),
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width, 53),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () => context.read<RandomCocktailCubit>().getRandomDrink(),
          child: const Text(
            'LookUp Random Drink',
          ),
        );
      },
    );
  }
}

class _FilterCard extends StatelessWidget {
  final String label;
  final String filterKey;
  final IconData icon;
  const _FilterCard({
    required this.label,
    required this.filterKey,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          switch (filterKey) {
            case 'ingredient':
              Navigator.pushNamed(
                context,
                IngredientsScreen.routeName,
              );
              break;
            default:
          }
        },
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 45,
              ),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
