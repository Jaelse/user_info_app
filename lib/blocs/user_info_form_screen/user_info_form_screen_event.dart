abstract class UserInfoFormScreenEvent {}


class UserInfoFormOnNameChangedEvent extends UserInfoFormScreenEvent{
  final String name;
  
  UserInfoFormOnNameChangedEvent(this.name);
}


class UserInfoFormOnEmailChangedEvent extends UserInfoFormScreenEvent{
  final String email;

  UserInfoFormOnEmailChangedEvent(this.email);
}

class UserInfoFormOnNumberChangedEvent extends UserInfoFormScreenEvent{
  final String number;

  UserInfoFormOnNumberChangedEvent(this.number);
}

class UserInfoFormOnDobChangedEvent extends UserInfoFormScreenEvent{
  final String dob;

  UserInfoFormOnDobChangedEvent(this.dob);
}

class UserInfoFormOnSubmitEvent extends UserInfoFormScreenEvent{

}
