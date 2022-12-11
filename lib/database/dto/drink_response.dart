import 'package:assignment/models/drink.dart';

class DrinkResponse {
  final List<Drink> drinks;

  DrinkResponse({required this.drinks});

  factory DrinkResponse.fromJson(Map<String, dynamic> json) => _fromJson(json);
}

DrinkResponse _fromJson(Map<String, dynamic> json) {
  return DrinkResponse(drinks: (json['drinks'] as List<dynamic>).map((drink) => Drink(
      name: drink['strDrink'] as String,
      imageUrl: drink['strDrinkThumb'] as String,
      id: drink['idDrink'] as String
    )).toList()
  );
}