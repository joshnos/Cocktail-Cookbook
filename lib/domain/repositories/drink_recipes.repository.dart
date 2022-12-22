import 'package:cocktail_coockbook/data/providers/drink_recipes.provider.dart';

import '../models/alcoholicFilter.model.dart';
import '../models/category.model.dart';
import '../models/drink.model.dart';
import '../models/glass.model.dart';
import '../models/ingredient.model.dart';
import '../models/ingredientName.model.dart';

class DrinkRecipesRepository {
  final DrinkRecipesProvider _dataProvider = DrinkRecipesProvider();

  Future<List<Drink>> searchCocktailByName(String name) async {
    List drinks = await _dataProvider.searchCocktailByName(name);
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> listCocktailsByFirstLetter(String firstLetter) async {
    List drinks = await _dataProvider.listCocktailsByFirstLetter(firstLetter);
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Ingredient>> searchIngredientByName(String name) async {
    List ingredients = await _dataProvider.searchIngredientByName(name);
    return ingredients.map((e) => Ingredient.fromJson(e)).toList();
  }

  Future<List<Drink>> lookupCocktailById(String id) async {
    List drinks = await _dataProvider.lookupCocktailById(id);
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Ingredient>> lookupIngredientById(String id) async {
    List ingredients = await _dataProvider.lookupIngredientById(id);
    return ingredients.map((e) => Ingredient.fromJson(e)).toList();
  }

  Future<List<Drink>> lookupRandomCocktail() async {
    List drinks = await _dataProvider.lookupRandomCocktail();
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> searchCocktailsByIngredient(String name) async {
    List drinks = await _dataProvider.searchCocktailsByIngredient(name);
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> filterCocktailsByAlcoholic(String alcoholic) async {
    List drinks = await _dataProvider.filterCocktailsByAlcoholic(alcoholic);
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> filterCocktailsByCategory(String category) async {
    List drinks = await _dataProvider.filterCocktailsByCategory(category);
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> filterCocktailsByGlass(String glass) async {
    List drinks = await _dataProvider.filterCocktailsByGlass(glass);
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Category>> listCategories() async {
    List drinks = await _dataProvider.listCategories();
    return drinks.map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Glass>> listGlasses() async {
    List drinks = await _dataProvider.listGlasses();
    return drinks.map((e) => Glass.fromJson(e)).toList();
  }

  Future<List<IngredientName>> listIngredients() async {
    List drinks = await _dataProvider.listIngredients();
    return drinks.map((e) => IngredientName.fromJson(e)).toList();
  }

  Future<List<AlcoholicFilter>> listAlcoholicFilters() async {
    List drinks = await _dataProvider.listAlcoholicFilters();
    return drinks.map((e) => AlcoholicFilter.fromJson(e)).toList();
  }

  String drinkImagePreview(String imagePath) {
    return _dataProvider.drinkImagePreview(imagePath);
  }

  String ingredientThumbnail(String name) {
    return _dataProvider.ingredientThumbnail(name);
  }
}
