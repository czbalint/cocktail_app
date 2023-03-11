import 'package:assignment/models/ingredient.dart';

class IngredientResponse{
  final Ingredient ingredient;

  IngredientResponse(this.ingredient);

  factory IngredientResponse.fromJson(Map<String, dynamic> json) =>  _fromJson((json["ingredients"] as List<dynamic>)[0]);
}

IngredientResponse _fromJson(Map<String, dynamic> map) {
  final ing = Ingredient(
    id: int.parse(map["idIngredient"] as String),
    name: map["strIngredient"] as String,
    description: map["strDescription"] as String?,
    type: map["strType"] as String?,
    alcoholic: (map["strAlcohol"] as String) == "Yes" ? true : false,
    ABV: map["strABV"] as String?
  );
  return IngredientResponse(ing);
}