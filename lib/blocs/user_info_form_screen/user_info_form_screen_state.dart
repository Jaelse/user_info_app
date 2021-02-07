import 'package:equatable/equatable.dart';

abstract class UserInfoFormScreenState extends Equatable {}

class UserInfoFormInitialState extends UserInfoFormScreenState {
  final String name;
  final String email;
  final String phoneNo;
  final String dob;

  final bool nameIsValid;
  final bool emailIsValid;
  final bool phoneNoIsValid;
  final bool dobIsValid;

  final bool userInfoSubmitted;

  UserInfoFormInitialState(
      {this.name,
      this.email,
      this.phoneNo,
      this.dob,
      this.nameIsValid,
      this.emailIsValid,
      this.phoneNoIsValid,
      this.dobIsValid,
      this.userInfoSubmitted});

  UserInfoFormInitialState copyWith(
      {String name,
      String email,
      String phoneNo,
      String dob,
      bool nameIsValid,
      bool emailIsValid,
      bool phoneNoIsValid,
      bool dobIsValid,
      bool userInfoSubmitted}) {
    return UserInfoFormInitialState(
        name: name ?? this.name,
        email: email ?? this.email,
        phoneNo: phoneNo ?? this.phoneNo,
        dob: dob ?? this.dob,
        nameIsValid: nameIsValid ?? this.nameIsValid,
        emailIsValid: emailIsValid ?? this.emailIsValid,
        phoneNoIsValid: phoneNoIsValid ?? this.phoneNoIsValid,
        dobIsValid: dobIsValid ?? this.dobIsValid,
        userInfoSubmitted: userInfoSubmitted ?? this.userInfoSubmitted);
  }

  @override
  List<Object> get props => [
        name,
        email,
        phoneNo,
        dob,
        nameIsValid,
        emailIsValid,
        phoneNoIsValid,
        dobIsValid,
        userInfoSubmitted
      ];
}
