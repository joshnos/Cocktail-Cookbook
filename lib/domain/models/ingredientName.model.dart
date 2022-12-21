class IngredientName {
  String? strIngredient1;

  IngredientName({
    this.strIngredient1,
  });

  IngredientName.fromJson(Map<String, dynamic> json) {
    strIngredient1 = json['strIngredient1'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'strIngredient1': strIngredient1,
    };
  }
}
