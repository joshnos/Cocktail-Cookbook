import 'package:cocktail_coockbook/data/apis/drink_recipes.api.dart';
import 'package:dio/dio.dart';

class DrinkRecipesProvider {
  final DrinkRecipesApi _api = DrinkRecipesApi();

  Future<List<Map<String, dynamic>>> searchCocktailByName(String name) async {
    Response response = await _api.searchCocktailByName(name);
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> listCocktailsByFirstLetter(
      String firstLetter) async {
    Response response = await _api.listCocktailsByFirstLetter(firstLetter);
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> searchIngredientByName(String name) async {
    Response response = await _api.searchIngredientByName(name);
    return response.data['ingredients'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> lookupCocktailById(String id) async {
    Response response = await _api.lookupCocktailById(id);
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> lookupIngredientById(String id) async {
    Response response = await _api.lookupIngredientById(id);
    return response.data['ingredients'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> lookupRandomCocktail() async {
    Response response = await _api.lookupRandomCocktail();
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> searchCocktailsByIngredient(
      String name) async {
    Response response = await _api.searchCocktailsByIngredient(name);
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> filterCocktailsByAlcoholic(
      String alcoholic) async {
    Response response = await _api.filterCocktailsByAlcoholic(alcoholic);
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> filterCocktailsByCategory(
      String category) async {
    Response response = await _api.filterCocktailsByCategory(category);
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> filterCocktailsByGlass(
      String glass) async {
    Response response = await _api.filterCocktailsByGlass(glass);
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> listCategories() async {
    Response response = await _api.listCategories();
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> listGlasses() async {
    Response response = await _api.listGlasses();
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> listIngredients() async {
    Response response = await _api.listIngredients();
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  Future<List<Map<String, dynamic>>> listAlcoholicFilters() async {
    Response response = await _api.listAlcoholicFilters();
    return response.data['drinks'] as List<Map<String, dynamic>>;
  }

  String drinkImagePreview(String imagePath) {
    return _api.drinkImagePreview(imagePath);
  }

  String ingredientThumbnail(String name) {
    return _api.ingredientThumbnail(name);
  }
}
