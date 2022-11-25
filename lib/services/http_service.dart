import 'package:assignment/dto/category_response.dart';
import 'package:assignment/dto/drink_response.dart';
import 'package:dio/dio.dart';

class HttpService {

  final _dio = Dio();

  Future<CategoryResponse?> getCategoryList() async {
    try {
      Response response;
      response = await _dio.get(
          'http://thecocktaildb.com/api/json/v1/1/list.php?c=list'
      );
      if (response.statusCode != 200) return null;
      return CategoryResponse.fromJson(response.data);
    } on DioError catch(e){
      print(e);
      return null;
    }
  }

  Future<DrinkResponse?> getDrinksByCategory(String selectedCategory) async {
    try {
      Response response;
      response = await _dio.get(
          'http://thecocktaildb.com/api/json/v1/1/filter.php?c=$selectedCategory'
      );
      if (response.statusCode != 200  || response.data is String) return null;
      return DrinkResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return null;
    }
  }
}