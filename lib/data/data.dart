import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:user_info_app/data/models/user_info.dart';
import 'package:user_info_app/data/service/user_info_service.dart';

class Data {
  Database _db;

  UserInfoService _userInfoService;

  Data._privateConstructor();

  static final Data instance = Data._privateConstructor();

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult]) {
    print(functionName);
    print(sql);
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
  }

  Future<void> createUserInfoTable(Database db) async {
    final userInfoSql = '''CREATE TABLE ${UserInfo.USER_INFO_TABLE}
    (
      ${UserInfo.ID} INTEGER PRIMARY KEY,
      ${UserInfo.NAME} TEXT,
      ${UserInfo.EMAIL} TEXT,
      ${UserInfo.PHONE} TEXT,
      ${UserInfo.DOB} INTEGER
    )''';

    await db.execute(userInfoSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = join(dir.path, dbName);

    return path;
  }

  Future<void> initDatabase() async {
    if (this._db == null) {
      final path = await getDatabasePath('user_info.db');
      this._db = await openDatabase(path, version: 1, onCreate: onCreate);
    }
  }

  Future<void> onCreate(Database db, int version) async {
    await createUserInfoTable(db);
  }

  UserInfoService userInfoService() {
    if (this._userInfoService == null) {
      this._userInfoService = UserInfoService(db: this._db);
    }

    return this._userInfoService;
  }
}
