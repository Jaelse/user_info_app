class UserInfo {
  static const USER_INFO_TABLE = 'user_info';
  static const ID = 'id';
  static const NAME = 'name';
  static const EMAIL = 'email';
  static const PHONE = 'phone';
  static const DOB = 'dob';

  final int id;
  final String name;
  final String email;
  final String phone;
  final int dob;

  UserInfo({this.id, this.name, this.email, this.phone, this.dob});

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json[ID],
      name: json[NAME],
      email: json[EMAIL],
      phone: json[PHONE],
      dob: json[DOB],
    );
  }
}
