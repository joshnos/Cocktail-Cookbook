import 'package:cocktail_coockbook/data/apis/drink_recipes.api.dart';
import 'package:dio/dio.dart';

class DrinkRecipesProvider {
  final DrinkRecipesApi _api = DrinkRecipesApi();

  Future<List?> searchCocktailByName(String name) async {
    Response response = await _api.searchCocktailByName(name);
    return response.data['drinks'] as List?;
  }

  Future<List?> listCocktailsByFirstLetter(String firstLetter) async {
    Response response = await _api.listCocktailsByFirstLetter(firstLetter);
    return response.data['drinks'] as List?;
  }

  Future<List?> searchIngredientByName(String name) async {
    Response response = await _api.searchIngredientByName(name);
    return response.data['ingredients'] as List?;
  }

  Future<List?> lookupCocktailById(String id) async {
    Response response = await _api.lookupCocktailById(id);
    return response.data['drinks'] as List?;
  }

  Future<List?> lookupIngredientById(String id) async {
    Response response = await _api.lookupIngredientById(id);
    return response.data['ingredients'] as List?;
  }

  Future<List?> lookupRandomCocktail() async {
    Response response = await _api.lookupRandomCocktail();
    return response.data['drinks'] as List?;
  }

  Future<List?> searchCocktailsByIngredient(String name) async {
    Response response = await _api.searchCocktailsByIngredient(name);
    return response.data['drinks'] as List?;
  }

  Future<List?> filterCocktailsByAlcoholic(String alcoholic) async {
    Response response = await _api.filterCocktailsByAlcoholic(alcoholic);
    return response.data['drinks'] as List?;
  }

  Future<List?> filterCocktailsByCategory(String category) async {
    Response response = await _api.filterCocktailsByCategory(category);
    return response.data['drinks'] as List?;
  }

  Future<List?> filterCocktailsByGlass(String glass) async {
    Response response = await _api.filterCocktailsByGlass(glass);
    return response.data['drinks'] as List?;
  }

  Future<List?> listCategories() async {
    Response response = await _api.listCategories();
    return response.data['drinks'] as List?;
  }

  Future<List?> listGlasses() async {
    Response response = await _api.listGlasses();
    return response.data['drinks'] as List?;
  }

  Future<List?> listIngredients() async {
    Response response = await _api.listIngredients();
    return response.data['drinks'] as List?;
  }

  Future<List?> listAlcoholicFilters() async {
    Response response = await _api.listAlcoholicFilters();
    return response.data['drinks'] as List?;
  }

  String drinkImagePreview(String imagePath) {
    return _api.drinkImagePreview(imagePath);
  }

  String ingredientThumbnail(String name) {
    return _api.ingredientThumbnail(name);
  }
}
