import "package:path/path.dart";
import "package:path_provider/path_provider.dart";
import "package:sqflite/sqflite.dart";

class Databaseconnection {
  Future<Database> setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, "Mydbexample");

    var database = await openDatabase(path, version: 1, onCreate: createtable);
    return database;
  }

  Future<void> createtable(Database database, int Version) async {
    String? sql =
        "create table student (id integer primary key AUTOINCREMENT,name text , subject text,marks text)";

    await database.execute(sql);
  }
}
