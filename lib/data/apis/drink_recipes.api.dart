import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';

class DrinkRecipesApi {
  static const String drinkRecipesApiBaseUrl = 'https://www.thecocktaildb.com/';
  static const String drinkRecipesApiJson = 'api/json/';
  static const String drinkRecipesApiVersion = 'v1/';
  static const String drinkRecipesApiKey = '1/';
  static const String drinkRecipesApiImages = 'images/';
  static const String drinkRecipesApiIngredients = 'ingredients/';
  static const String drinkRecipesApiMediaDrinks = 'media/drink/';
  static const String drinkRecipesApiPreview = 'preview';

  final Dio _dioHttpClient = Dio()..interceptors.add(HttpFormatter());

  Future<Response> searchCocktailByName(String name) {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}search.php?s=$name';

    return _dioHttpClient.get(path);
  }

  Future<Response> listCocktailsByFirstLetter(String firstLetter) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}search.php?f=$firstLetter';

    return _dioHttpClient.get(path);
  }

  Future<Response> searchIngredientByName(String name) {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}search.php?i=$name';

    return _dioHttpClient.get(path);
  }

  Future<Response> lookupCocktailById(String id) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}lookup.php?i=$id';

    return _dioHttpClient.get(path);
  }

  Future<Response> lookupIngredientById(String id) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}lookup.php?iid=$id';

    return _dioHttpClient.get(path);
  }

  Future<Response> lookupRandomCocktail() async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}random.php';

    return _dioHttpClient.get(path);
  }

  Future<Response> searchCocktailsByIngredient(String name) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}filter.php?i=$name';

    return _dioHttpClient.get(path);
  }

  Future<Response> filterCocktailsByAlcoholic(String alcoholic) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}filter.php?a=$alcoholic';

    return _dioHttpClient.get(path);
  }

  Future<Response> filterCocktailsByCategory(String category) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}filter.php?c=$category';

    return _dioHttpClient.get(path);
  }

  Future<Response> filterCocktailsByGlass(String glass) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}filter.php?g=$glass';

    return _dioHttpClient.get(path);
  }

  Future<Response> listCategories() async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}list.php?c=list';

    return _dioHttpClient.get(path);
  }

  Future<Response> listGlasses() async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}list.php?g=list';

    return _dioHttpClient.get(path);
  }

  Future<Response> listIngredients() async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}list.php?i=list';

    return _dioHttpClient.get(path);
  }

  Future<Response> listAlcoholicFilters() async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiJson$drinkRecipesApiVersion${drinkRecipesApiKey}list.php?a=list';

    return _dioHttpClient.get(path);
  }

  Future<Response> drinkImagePreview(String imagePath) async {
    String path = '$imagePath/$drinkRecipesApiPreview';

    return _dioHttpClient.get(path);
  }

  Future<Response> ingredientThumbnail(String name) async {
    String path =
        '$drinkRecipesApiBaseUrl$drinkRecipesApiImages$drinkRecipesApiIngredients$name.png';

    return _dioHttpClient.get(path);
  }
}
