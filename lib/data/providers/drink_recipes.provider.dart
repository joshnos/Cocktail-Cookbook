import 'package:cocktail_coockbook/data/apis/drink_recipes.api.dart';
import 'package:cocktail_coockbook/domain/models/alcoholicFilter.model.dart';
import 'package:cocktail_coockbook/domain/models/category.model.dart';
import 'package:cocktail_coockbook/domain/models/drink.model.dart';
import 'package:cocktail_coockbook/domain/models/glass.model.dart';
import 'package:cocktail_coockbook/domain/models/ingredient.model.dart';
import 'package:cocktail_coockbook/domain/models/ingredientName.model.dart';
import 'package:dio/dio.dart';

class DrinkRecipesProvider {
  final DrinkRecipesApi api = DrinkRecipesApi();

  Future<List<Drink>> searchCocktailByName(String name) async {
    Response response = await api.searchCocktailByName(name);
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> listCocktailsByFirstLetter(String firstLetter) async {
    Response response = await api.listCocktailsByFirstLetter(firstLetter);
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Ingredient>> searchIngredientByName(String name) async {
    Response response = await api.searchIngredientByName(name);
    List<Map<String, dynamic>> drinks =
        response.data['ingredients'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Ingredient.fromJson(e)).toList();
  }

  Future<List<Drink>> lookupCocktailById(String id) async {
    Response response = await api.lookupCocktailById(id);
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Ingredient>> lookupIngredientById(String id) async {
    Response response = await api.lookupIngredientById(id);
    List<Map<String, dynamic>> drinks =
        response.data['ingredients'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Ingredient.fromJson(e)).toList();
  }

  Future<List<Drink>> lookupRandomCocktail() async {
    Response response = await api.lookupRandomCocktail();
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> searchCocktailsByIngredient(String name) async {
    Response response = await api.searchCocktailsByIngredient(name);
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> filterCocktailsByAlcoholic(String alcoholic) async {
    Response response = await api.filterCocktailsByAlcoholic(alcoholic);
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> filterCocktailsByCategory(String category) async {
    Response response = await api.filterCocktailsByCategory(category);
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Drink>> filterCocktailsByGlass(String glass) async {
    Response response = await api.filterCocktailsByGlass(glass);
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Drink.fromJson(e)).toList();
  }

  Future<List<Category>> listCategories() async {
    Response response = await api.listCategories();
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Glass>> listGlasses() async {
    Response response = await api.listGlasses();
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => Glass.fromJson(e)).toList();
  }

  Future<List<IngredientName>> listIngredients() async {
    Response response = await api.listIngredients();
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => IngredientName.fromJson(e)).toList();
  }

  Future<List<AlcoholicFilter>> listAlcoholicFilters() async {
    Response response = await api.listAlcoholicFilters();
    List<Map<String, dynamic>> drinks =
        response.data['drinks'] as List<Map<String, dynamic>>;
    return drinks.map((e) => AlcoholicFilter.fromJson(e)).toList();
  }

  String drinkImagePreview(String imagePath) {
    return api.drinkImagePreview(imagePath);
  }

  String ingredientThumbnail(String name) {
    return api.ingredientThumbnail(name);
  }
}
