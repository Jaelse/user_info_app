import 'package:user_info_app/data/models/user_info.dart';
import 'package:user_info_app/data/service/user_info_service.dart';
import 'package:user_info_app/domain/entity/user_info_entity.dart';

class UserInfoRepository {
  final UserInfoService _userInfoService;

  UserInfoRepository({UserInfoService userInfoService})
      : this._userInfoService = userInfoService;

  Future<List<UserInfoEntity>> getUsers() async {
    List<UserInfo> userInfos = await _userInfoService.getUsers();

    List<UserInfoEntity> userInfoEntities = List<UserInfo>.from(userInfos).map(
        (e) => UserInfoEntity(
            id: e.id,
            name: e.name,
            email: e.email,
            dob: DateTime.fromMillisecondsSinceEpoch(e.dob),
            phone: e.phone)).toList();

    return userInfoEntities;
  }


  Future<int> addUser({String name, String email, String phone, DateTime dob}) async{
    int id = await _userInfoService.addUser(name, email, phone, dob);

    return id;
  }
}
