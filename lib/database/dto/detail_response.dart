import 'package:assignment/models/detail.dart';
import 'package:assignment/models/drink.dart';

class DetailResponse{
  final Drink drink;

  DetailResponse(this.drink);
  
  factory DetailResponse.fromJson(Map<String, dynamic> json, Drink drink) => _fromJson(json, drink);
}

DetailResponse _fromJson(Map<String, dynamic> json, Drink drink) {
  final detail = Detail(
    glass: json["strGlass"] as String,
    isAlcohol: (json["strAlcoholic"] as String) == "Alcoholic" ? true : false,
    instruction: json["strInstructions"] as String,
    ingredients: _getIngredients(json),
    measure: _getMeasure(json)
  );
  drink.detail = detail;
  return DetailResponse(drink);
}

List<String> _getMeasure(Map<String, dynamic> json) {
  List<String> measures = [];
  for (int i = 1; i <= 15; i++){
    final measure = json["strMeasure$i"];
    if (measure == null) return measures;
    measures.add(measure);
  }
  return measures;
}

List<String> _getIngredients(Map<String, dynamic> json) {
  List<String> ingredients = [];
  for (int i = 1; i <= 15; i++){
    final ingredient = json["strIngredient$i"];
    if (ingredient == null) return ingredients;
    ingredients.add(ingredient);
  }
  return ingredients;
}