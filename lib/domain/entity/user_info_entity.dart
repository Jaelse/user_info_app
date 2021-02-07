class UserInfoEntity {
  final int _id;
  final String _name;
  final String _email;
  final String _phone;
  final DateTime _dob;

  UserInfoEntity(
      {int id, String name, String email, String phone, DateTime dob})
      : _id = id,
        _name = name,
        _email = email,
        _phone = phone,
        _dob = dob;

  int get id => _id;

  String get name => _name;

  String get email => _email;

  String get phone => _phone;

  DateTime get dob => _dob;
}
