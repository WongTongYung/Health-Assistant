import 'package:app/userRegistration/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //create a database file userdb.db
  final databaseName = "userdb.db";

  //next is to create a table
  String users =
      "create table users (usrId INTEGER PRIMARY KEY AUTOINCREMENT, usrName TEXT UNIQUE, usrPassword TEXT)";

  //we can initialize the database here
  Future<Database> initDB() async {
    //get the database path
    final databasePath = await getDatabasesPath();

    //next we join the database path with the database name
    //getDatabasesPath() check the location of the database
    //joindatabase path with the database name create a unique path
    //that identifies where the database file will reside.
    final path = join(databasePath, databaseName);

    //openDatabase() is used to open the database
    //and it returns a database object
    //execute() is used to execute an SQL query with no return value.
    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(users);
    });
  }

  //This is login function by return boolean
  //It queries the database of usrName and usrPassword
  //by login the Users class
  Future<bool> login(Users user) async {
    final Database db = await initDB();

    var result = await db.rawQuery(
        "SELECT * FROM users WHERE usrName = '${user.usrName}' AND usrPassword = '${user.usrPassword}'");
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  //Sign up
  //This function inserts the user into the database
  Future<int> signup(Users user) async {
    final Database db = await initDB();

    List<Map<String, dynamic>> existingUser = await db.query(
      'users',
      where: 'usrname = ?', // Assuming you have a 'username' field
      whereArgs: [user.usrName],
    );
    if (existingUser.isNotEmpty) {
      return -1;
    }

    return db.insert('users', user.toMap());
  }

  // Method to retrieve the username by usrId
  Future<String?> getUsername(int usrId) async {
    final Database db = await initDB();

    // Query the database for the user by usrId
    final List<Map<String, dynamic>> result = await db.query(
      'users',
      columns: ['usrName'],
      where: 'usrId = ?',
      whereArgs: [usrId],
    );

    // Check if a result is found and return the username
    if (result.isNotEmpty) {
      return result.first['usrName'] as String;
    } else {
      return 'guest'; // Return null if no user is found
    }
  }
}
