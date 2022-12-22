import 'package:flutter/material.dart';

import '../../../domain/models/drink.model.dart';
import '../../screens/drink_detials/drink_details.screen.dart';
import '../route_arguments/drink_details.arguments.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;
  const DrinkCard({Key? key, required this.drink}) : super(key: key);

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
              BlendMode.darken,
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
