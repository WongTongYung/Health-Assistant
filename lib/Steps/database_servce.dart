
import 'package:app/Steps/tsk.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseServce {
  static Database? _datab;
  static final DatabaseServce instance = DatabaseServce._constructor();

  final String _tasksTableName = "tasks";
  final String _tasksStepColumnName = "steps";
  final String _tasksIdColumnName = "id";

  DatabaseServce._constructor();

  Future<Database> get database async {
    if (_datab != null) return _datab!;
    _datab = await getDatabase();
    return _datab!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "masterdatab.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (datab, version) {
        datab.execute('''
        CREATE TABLE $_tasksTableName (
          $_tasksIdColumnName INTEGER PRIMARY KEY,
          $_tasksStepColumnName INTEGER NOT NULL
        )
      ''');
      },
    );

    print("Database created: $databasePath");
    return database;
  }

  Future<List<Tsk>> getStepCount() async {
    final datab = await database;
    final data = await datab.query(_tasksTableName);

    print("Retrieved data: $data");

    return data
        .map((e) => Tsk(
              id: e[_tasksIdColumnName] as int,
              steps: e[_tasksStepColumnName] as int,
            ))
        .toList();
  }

  void updateStepCount(int id, int steps) async {
    final datab = await database;
    final affectedRows = await datab.update(
      _tasksTableName,
      {
        _tasksStepColumnName: steps,
      },
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );
    print("Updated $affectedRows rows for task ID: $id");
  }

  void deleteStepCount(
    int id,
  ) async {
    final datab = await database;
    await datab.delete(
      _tasksTableName,
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );
  }

  Future<void> addTask(int steps) async {
    final datab = await database;
    await datab.insert(
      _tasksTableName,
      {
        _tasksStepColumnName: steps,
      },
      conflictAlgorithm: ConflictAlgorithm.replace, // Handle conflicts
    );
    print("Inserted new task with steps: $steps");
  }
}
