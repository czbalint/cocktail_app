abstract class DrinkRepository<T> {
  Future<void> init();

  Future<List<T>> getALLDrinks();

  Future<T?> getDrinkById(int id);

  Future<void> insertDrink(T drink);

  Future<void> removeDrink(T drink);
}