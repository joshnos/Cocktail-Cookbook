import 'package:cocktail_coockbook/application/lookup_drink_by_id_cubit/lookup_drink_by_id_cubit.dart';
import 'package:cocktail_coockbook/application/utils/enums/api_status.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/layouts/full_screen.layout.dart';

class DrinkDetails extends StatelessWidget {
  const DrinkDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LookupDrinkByIdCubit, LookupDrinkByIdState>(
      listener: (context, state) {},
      child: const FullScreenLayout(
        child: CustomScrollView(
          slivers: [
            DrinkSilverAppBar(),
            SliverPadding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 35, bottom: 35),
              sliver: SliverToBoxAdapter(
                child: _DrinkProperties(),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 10, right: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Ingredients',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            _IngredientsList(),
            SliverPadding(
              padding: EdgeInsets.only(left: 10, right: 10),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Instructions',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 20),
              sliver: SliverToBoxAdapter(
                child: _DrinkInstructions(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrinkSilverAppBar extends StatelessWidget {
  const DrinkSilverAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LookupDrinkByIdCubit, LookupDrinkByIdState>(
      builder: (context, state) {
        if (state.status == ApiStatus.loaded) {
          return SliverAppBar(
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height * .4,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: LayoutBuilder(
                builder: (context, constraints) {
                  return Text(
                    state.data!.strDrink ?? 'Drink Details',
                    style: TextStyle(
                      color: constraints.maxHeight < 150
                          ? Colors.black
                          : Colors.white,
                    ),
                  );
                },
              ),
              background: Image(
                image: NetworkImage(
                    state.data!.strDrinkThumb ?? 'https://dummyimage.com/300'),
                fit: BoxFit.fill,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.color,
              ),
            ),
          );
        }
        return const SliverAppBar();
      },
    );
  }
}

class _DrinkProperties extends StatelessWidget {
  const _DrinkProperties({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LookupDrinkByIdCubit, LookupDrinkByIdState>(
      builder: (context, state) {
        if (state.status == ApiStatus.loading) {
          return const SizedBox(
              child: Center(child: CircularProgressIndicator()));
        }
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Text(
                    'Glass',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    state.data!.strGlass ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(),
              Column(
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    state.data!.strCategory ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const VerticalDivider(),
              Column(
                children: [
                  const Text(
                    'Alcholic',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    state.data!.strAlcoholic ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _IngredientsList extends StatelessWidget {
  const _IngredientsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LookupDrinkByIdCubit, LookupDrinkByIdState>(
      builder: (context, state) {
        if (state.status == ApiStatus.loaded) {
          return SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: SliverGrid.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: (.6 / 1),
              children: [
                if (state.data!.strIngredient1 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure1!,
                    name: state.data!.strIngredient1!,
                  ),
                if (state.data!.strIngredient2 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure2!,
                    name: state.data!.strIngredient2!,
                  ),
                if (state.data!.strIngredient3 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure3!,
                    name: state.data!.strIngredient3!,
                  ),
                if (state.data!.strIngredient4 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure4!,
                    name: state.data!.strIngredient4!,
                  ),
                if (state.data!.strIngredient5 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure5!,
                    name: state.data!.strIngredient5!,
                  ),
                if (state.data!.strIngredient6 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure6!,
                    name: state.data!.strIngredient6!,
                  ),
                if (state.data!.strIngredient7 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure7!,
                    name: state.data!.strIngredient7!,
                  ),
                if (state.data!.strIngredient8 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure8!,
                    name: state.data!.strIngredient8!,
                  ),
                if (state.data!.strIngredient9 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure9!,
                    name: state.data!.strIngredient9!,
                  ),
                if (state.data!.strIngredient10 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure10!,
                    name: state.data!.strIngredient10!,
                  ),
                if (state.data!.strIngredient1 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure1!,
                    name: state.data!.strIngredient1!,
                  ),
                if (state.data!.strIngredient1 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure1!,
                    name: state.data!.strIngredient1!,
                  ),
                if (state.data!.strIngredient1 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure1!,
                    name: state.data!.strIngredient1!,
                  ),
                if (state.data!.strIngredient11 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure11!,
                    name: state.data!.strIngredient11!,
                  ),
                if (state.data!.strIngredient12 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure12!,
                    name: state.data!.strIngredient12!,
                  ),
                if (state.data!.strIngredient13 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure13!,
                    name: state.data!.strIngredient13!,
                  ),
                if (state.data!.strIngredient14 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure14!,
                    name: state.data!.strIngredient14!,
                  ),
                if (state.data!.strIngredient15 != null)
                  _IngredientCard(
                    measure: state.data!.strMeasure15!,
                    name: state.data!.strIngredient15!,
                  ),
              ],
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }
}

class _IngredientCard extends StatelessWidget {
  final String measure;
  final String name;
  const _IngredientCard({
    required this.measure,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(20.0),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(
                  context
                      .read<LookupDrinkByIdCubit>()
                      .getIngredientImageUrl(name),
                ),
              ),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  measure,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
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

class _DrinkInstructions extends StatelessWidget {
  const _DrinkInstructions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LookupDrinkByIdCubit, LookupDrinkByIdState>(
      builder: (context, state) {
        if (state.status == ApiStatus.loading) {
          return const SizedBox(
              child: Center(child: CircularProgressIndicator()));
        }
        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  state.data!.strInstructions ?? '',
                  softWrap: true,
                  style: const TextStyle(
                    overflow: TextOverflow.clip,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
