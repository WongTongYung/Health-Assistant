import 'package:app/addTask/task.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  final String _tasksTableName = "tasks";
  final String _tasksIdColumnName = "id";
  final String _tasksContentColumnName = "content";
  final String _tasksStatusColumnName = "status";

  DatabaseService._constructor();

  //put async so we can use the await or future
  //This function will check if the database is null or not
  //If null it will create a new database by getDatabase()
  //Else it return with _db! which is L7
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  //This is the data stored from the added task
  //it create a table that store the data
  //by join the databasepath and a database file
  //This function only be used when database is null
  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, "master_db.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $_tasksTableName (
          $_tasksIdColumnName INTEGER PRIMARY KEY,
          $_tasksContentColumnName TEXT NOT NULL,
          $_tasksStatusColumnName INTEGER NOT NULL
        )
        ''');
      },
    );
    return database;
  }

  void addTask(
    String content,
  ) async {
    //db is used to open the database
    final db = await database;
    //insert data
    await db.insert(
      _tasksTableName,
      {
        _tasksContentColumnName: content, // add data to content
        _tasksStatusColumnName: 0, //0 refer to false
      },
    );
  }

//This is import from the task file
  Future<List<Task>> getTasks() async {
    final db = await database;
    final data = await db.query(_tasksTableName);
    List<Task> tasks = data
        .map(
          (e) => Task(
            id: e["id"] as int,
            status: e["status"] as int,
            content: e["content"] as String,
          ),
        )
        .toList();
    return tasks;
  }

  void updateTaskStatus(int id, int status) async {
    final db = await database;
    await db.update(
      _tasksTableName,
      {
        _tasksStatusColumnName: status,
      },
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );
  }

  void deleteTask(
    int id,
  ) async {
    final db = await database;
    await db.delete(
      _tasksTableName,
      where: 'id = ?',
      whereArgs: [
        id,
      ],
    );
  }
}
