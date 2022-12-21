class Ingredient {
  String? idIngredient;
  String? strIngredient;
  String? strDescription;
  String? strType;
  String? strAlcohol;
  String? strABV;

  Ingredient({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
    this.strAlcohol,
    this.strABV,
  });

  Ingredient.fromJson(Map<String, dynamic> json) {
    idIngredient = json['idIngredient'];
    strIngredient = json['strIngredient'];
    strDescription = json['strDescription'];
    strType = json['strType'];
    strAlcohol = json['strAlcohol'];
    strABV = json['strABV'];
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'idIngredient': idIngredient,
      'strIngredient': strIngredient,
      'strDescription': strDescription,
      'strType': strType,
      'strAlcohol': strAlcohol,
      'strABV': strABV,
    };
  }
}
