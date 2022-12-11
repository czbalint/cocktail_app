class CategoryResponse {
  final List<String> categories;

  CategoryResponse({required this.categories});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(categories: (json['drinks'] as List<dynamic>).map((e) => e['strCategory'] as String).toList());
}
