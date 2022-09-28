import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

import '../model/MyScore.dart';

class DBHelper {
  static Database? _db;
  static const String tableName = 'MyScore';


  static createDatabase() async
  {
    _db = await openDatabase('myscore.db', version: 1,

        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          print('db created');
          await db.execute(
              'CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, '
                  'score TEXT,datetime TEXT)'
          );
        }, onOpen: (Database db) {
          print('opend database');
        }
    );

    if (_db != null)
      print('we have database');
  }

  Future<int> insertScore(MyScore? myScore) async {
    print('insert to DB');
    return _db!.insert(tableName, myScore!.toJson());
  }

  Future<int> deleteScore(MyScore myScore) async {
    return _db!.delete(tableName, where: 'id=?', whereArgs: [myScore.id]);
  }

  Future<int> deleteAll(MyScore myScore) async {
    return _db!.rawDelete(tableName);
  }

  Future <List<Map<String, dynamic>>> getAllScore() async {
    return await _db!.query(tableName);
  }
}