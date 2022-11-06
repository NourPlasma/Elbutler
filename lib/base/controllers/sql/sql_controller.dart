import 'package:ebutler_task/base/models/user_sql_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:get/get.dart' as gt;

class SqlController extends gt.GetxController {
  Database? _database;
  String tableName = 'users';
  String dbName = 'ebutlerDb.db';

  Future initDatabase() async {
    return _database = await _initDB();
  }

  Future<Database> _initDB() async {
    var documentsDirectory = await getApplicationDocumentsDirectory();
    var path = join(documentsDirectory.path, dbName);
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "id INTEGER PRIMARY KEY,"
          "email TEXT"
          ")");
    });
  }

  @override
  void onInit() {
    initDatabase();
    super.onInit();
  }

  Future insert(UserSqlModel model) async {
    await _database!.insert(tableName, model.toJson());
  }

  Future<List<UserSqlModel>> loadAll() async {
    var res = await _database!.query(tableName);
    List<UserSqlModel> list = res.isNotEmpty
        ? res.map((item) => UserSqlModel.fromJson(item)).toList()
        : [];
    return list;
  }
}
