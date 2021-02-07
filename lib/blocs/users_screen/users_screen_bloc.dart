import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_app/blocs/users_screen/users_screen_event.dart';
import 'package:user_info_app/blocs/users_screen/users_screen_state.dart';
import 'package:user_info_app/domain/entity/user_info_entity.dart';
import 'package:user_info_app/domain/repository/user_info_repository.dart';

class UsersScreenBloc extends Bloc<UsersScreenEvent, UsersScreenState> {
  UsersScreenBloc({UserInfoRepository userInfoRepository})
      : _userInfoRepository = userInfoRepository,
        super(UsersScreenInitialState());

  UserInfoRepository _userInfoRepository;

  @override
  Stream<UsersScreenState> mapEventToState(UsersScreenEvent event) async* {
    if (event is UsersScreenGetAllUsersEvent) {
      yield* _mapUsersScreenGetAllUsersEventToState(event, state);
    }
  }

  Stream<UsersScreenState> _mapUsersScreenGetAllUsersEventToState(
      UsersScreenGetAllUsersEvent event, UsersScreenState state) async* {
    if (state is UsersScreenInitialState) {
      List<UserInfoEntity> users = await _userInfoRepository.getUsers();

      yield UsersScreenSuccessState(users: users);
    }
  }
}
