// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDrinkDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DrinkDatabaseBuilder databaseBuilder(String name) =>
      _$DrinkDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DrinkDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$DrinkDatabaseBuilder(null);
}

class _$DrinkDatabaseBuilder {
  _$DrinkDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DrinkDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DrinkDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DrinkDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DrinkDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DrinkDatabase extends DrinkDatabase {
  _$DrinkDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DrinkDao? _drinkDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `drinks` (`name` TEXT NOT NULL, `imageUrl` TEXT NOT NULL, `id` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DrinkDao get drinkDao {
    return _drinkDaoInstance ??= _$DrinkDao(database, changeListener);
  }
}

class _$DrinkDao extends DrinkDao {
  _$DrinkDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _floorDrinkInsertionAdapter = InsertionAdapter(
            database,
            'drinks',
            (FloorDrink item) => <String, Object?>{
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'id': item.id
                }),
        _floorDrinkDeletionAdapter = DeletionAdapter(
            database,
            'drinks',
            ['id'],
            (FloorDrink item) => <String, Object?>{
                  'name': item.name,
                  'imageUrl': item.imageUrl,
                  'id': item.id
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorDrink> _floorDrinkInsertionAdapter;

  final DeletionAdapter<FloorDrink> _floorDrinkDeletionAdapter;

  @override
  Future<List<FloorDrink>> findAllDrink() async {
    return _queryAdapter.queryList('SELECT * FROM Drinks',
        mapper: (Map<String, Object?> row) => FloorDrink(row['name'] as String,
            row['imageUrl'] as String, row['id'] as String));
  }

  @override
  Future<FloorDrink?> findDrinkById(int id) async {
    return _queryAdapter.query('SELECT * FROM WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorDrink(row['name'] as String,
            row['imageUrl'] as String, row['id'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertDrink(FloorDrink drink) async {
    await _floorDrinkInsertionAdapter.insert(drink, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteDrink(FloorDrink drink) async {
    await _floorDrinkDeletionAdapter.delete(drink);
  }
}
