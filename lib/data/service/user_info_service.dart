import 'package:sqflite/sqflite.dart';
import 'package:user_info_app/data/models/user_info.dart';

class UserInfoService {
  final Database _db;

  UserInfoService({Database db}) : this._db = db;

  Future<UserInfo> getUser(String id) async {
    List<Map> cursor = await _db.rawQuery(
        "select * from " +
            UserInfo.USER_INFO_TABLE +
            " where " +
            UserInfo.ID +
            "=?'" +
            "'",
        [id]);

    UserInfo userInfo = UserInfo.fromJson(cursor[0]);

    return userInfo;
  }

  Future<List<UserInfo>> getUsers() async {
    List<Map> rawData = await _db.query(UserInfo.USER_INFO_TABLE);

    List<UserInfo> users =
        List<Map>.from(rawData).map((Map e) => UserInfo.fromJson(e)).toList();

    return users;
  }

  Future<int> addUser(
      String name, String email, String phone, DateTime dob) async {
    Map<String, dynamic> row = {
      UserInfo.NAME: name,
      UserInfo.EMAIL: email,
      UserInfo.PHONE: phone,
      UserInfo.DOB: dob.millisecondsSinceEpoch
    };

    return await _db.insert(UserInfo.USER_INFO_TABLE, row);
  }

  Future<bool> updateUser(
      {int id, String name, String email, String phone, DateTime dob}) async {
    Map<String, dynamic> row = {
      UserInfo.NAME: name,
      UserInfo.EMAIL: email,
      UserInfo.PHONE: phone,
      UserInfo.DOB: dob
    };

    int count = await _db.update(UserInfo.USER_INFO_TABLE, row,
        where: '${UserInfo.ID} = ?', whereArgs: [id]);

    if (count > 0) {
      return true;
    }

    return false;
  }
}
