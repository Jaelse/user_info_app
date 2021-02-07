import 'package:equatable/equatable.dart';
import 'package:user_info_app/domain/entity/user_info_entity.dart';

abstract class UsersScreenState extends Equatable {}

class UsersScreenInitialState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class UsersScreenSuccessState extends UsersScreenState {
  final List<UserInfoEntity> users;

  UsersScreenSuccessState({this.users});

  UsersScreenSuccessState copyWith(List<UserInfoEntity> users) {
    return UsersScreenSuccessState(users: users ?? this.users);
  }

  @override
  List<Object> get props => [users];
}

class UsersScreenInProgressState extends UsersScreenState {
  @override
  List<Object> get props => [];
}

class UsersScreenFailureState extends UsersScreenState {
  @override
  List<Object> get props => [];
}
