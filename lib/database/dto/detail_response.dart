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
    ingredients: ingredients,
    measure: measure
  );
  drink.detail = detail;
  return DetailResponse(drink);
}