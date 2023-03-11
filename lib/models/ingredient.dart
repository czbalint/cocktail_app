class Ingredient {
  final int id;
  final String name;
  final String? description;
  final String? type;
  final bool alcoholic;
  final String? ABV;

  Ingredient({
      required this.id,
      required this.name,
      required this.description,
      required this.type,
      required this.alcoholic,
      required this.ABV
  });
}