import 'package:cocktail_coockbook/application/search_by_name_cubit/search_by_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/utils/enums/api_status.enum.dart';
import '../../utils/widgets/drink_card.widget.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchByNameCubit, SearchByNameState>(
      listener: (context, state) {},
      child: SingleChildScrollView(
        child: Column(
          children: const [
            _SearchInput(),
            Divider(),
            _DrinksList(),
          ],
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Center(
      child: TextField(
        controller: controller,
        onChanged: (value) =>
            context.read<SearchByNameCubit>().getDrinksByName(value),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                context.read<SearchByNameCubit>().clearSearch();
                controller.clear();
              },
            ),
            hintText: 'Search...',
            border: InputBorder.none),
      ),
    );
  }
}

class _DrinksList extends StatelessWidget {
  const _DrinksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchByNameCubit, SearchByNameState>(
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
                  if (state.drinksList.isEmpty)
                    const Center(
                      child: Text('No drinks were found with that name'),
                    ),
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: state.drinksList
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
