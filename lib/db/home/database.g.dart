// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorHomeDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$HomeDataBaseBuilder databaseBuilder(String name) =>
      _$HomeDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$HomeDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$HomeDataBaseBuilder(null);
}

class _$HomeDataBaseBuilder {
  _$HomeDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$HomeDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$HomeDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<HomeDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$HomeDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$HomeDataBase extends HomeDataBase {
  _$HomeDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  HomeDao? _homeDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `HomeEntity` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  HomeDao get homeDao {
    return _homeDaoInstance ??= _$HomeDao(database, changeListener);
  }
}

class _$HomeDao extends HomeDao {
  _$HomeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _homeEntityInsertionAdapter = InsertionAdapter(
            database,
            'HomeEntity',
            (HomeEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<HomeEntity> _homeEntityInsertionAdapter;

  @override
  Future<List<HomeEntity>> getList() async {
    return _queryAdapter.queryList('SELECT * FROM Person',
        mapper: (Map<String, Object?> row) =>
            HomeEntity(id: row['id'] as int, name: row['name'] as String));
  }

  @override
  Future<void> insertHome(HomeEntity v) async {
    await _homeEntityInsertionAdapter.insert(v, OnConflictStrategy.abort);
  }
}
