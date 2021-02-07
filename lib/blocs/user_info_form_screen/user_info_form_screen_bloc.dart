import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_app/blocs/user_info_form_screen/user_info_form_screen_event.dart';
import 'package:user_info_app/blocs/user_info_form_screen/user_info_form_screen_state.dart';
import 'package:user_info_app/domain/repository/user_info_repository.dart';

class UserInfoFormScreenBloc
    extends Bloc<UserInfoFormScreenEvent, UserInfoFormScreenState> {
  UserInfoFormScreenBloc({UserInfoRepository userInfoRepository})
      : _userInfoRepository = userInfoRepository,
        super(UserInfoFormInitialState(
            nameIsValid: true,
            emailIsValid: true,
            dobIsValid: true,
            phoneNoIsValid: true,
            userInfoSubmitted: false));

  UserInfoRepository _userInfoRepository;

  @override
  Stream<UserInfoFormScreenState> mapEventToState(
      UserInfoFormScreenEvent event) async* {
    if (event is UserInfoFormOnNameChangedEvent) {
      yield* _mapUserInfoFormOnNameChangedEventToState(event, state);
    } else if (event is UserInfoFormOnEmailChangedEvent) {
      yield* _mapUserInfoFormOnEmailChangedEventToState(event, state);
    } else if (event is UserInfoFormOnNumberChangedEvent) {
      yield* _mapUserInfoFormOnPhoneChangedEventToState(event, state);
    } else if (event is UserInfoFormOnDobChangedEvent) {
      yield* _mapUserInfoFormOnDobChangedEventToState(event, state);
    } else if (event is UserInfoFormOnSubmitEvent) {
      yield* _mapUserInfoFormOnSubmitToState(event, state);
    }
  }

  Stream<UserInfoFormScreenState> _mapUserInfoFormOnNameChangedEventToState(
      UserInfoFormOnNameChangedEvent event,
      UserInfoFormScreenState state) async* {
    if (state is UserInfoFormInitialState) {
      yield state.copyWith(name: event.name);
    }
  }

  Stream<UserInfoFormScreenState> _mapUserInfoFormOnEmailChangedEventToState(
      UserInfoFormOnEmailChangedEvent event,
      UserInfoFormScreenState state) async* {
    if (state is UserInfoFormInitialState) {
      yield state.copyWith(email: event.email);
    }
  }

  Stream<UserInfoFormScreenState> _mapUserInfoFormOnPhoneChangedEventToState(
      UserInfoFormOnNumberChangedEvent event,
      UserInfoFormScreenState state) async* {
    if (state is UserInfoFormInitialState) {
      yield state.copyWith(phoneNo: event.number);
    }
  }

  Stream<UserInfoFormScreenState> _mapUserInfoFormOnDobChangedEventToState(
      UserInfoFormOnDobChangedEvent event,
      UserInfoFormScreenState state) async* {
    if (state is UserInfoFormInitialState) {
      yield state.copyWith(dob: event.dob);
    }
  }

  Stream<UserInfoFormScreenState> _mapUserInfoFormOnSubmitToState(
      UserInfoFormOnSubmitEvent event, UserInfoFormScreenState state) async* {
    if (state is UserInfoFormInitialState) {
      bool nameIsValid;
      bool emailIsValid;
      bool phoneIsValid;
      bool dobIsValid;

      if (state.name != null) {
        nameIsValid = validateName(state.name);
      } else
        nameIsValid = false;

      if (state.email != null) {
        emailIsValid = validateEmail(state.email);
      } else
        emailIsValid = false;

      if (state.phoneNo != null) {
        phoneIsValid = validatePhone(state.phoneNo);
      } else
        phoneIsValid = false;

      if (state.dob != null) {
        dobIsValid = validateDob(state.dob);
      } else
        dobIsValid = false;

      if (nameIsValid && emailIsValid && phoneIsValid && dobIsValid) {
        int id = await _userInfoRepository.addUser(
            name: state.name,
            email: state.email,
            phone: state.phoneNo,
            dob: DateTime.parse(state.dob));

        if (id != null) {
          yield state.copyWith(userInfoSubmitted: true);
        }
      } else
        yield state.copyWith(
            nameIsValid: nameIsValid,
            emailIsValid: emailIsValid,
            phoneNoIsValid: phoneIsValid,
            dobIsValid: dobIsValid);
    }
  }

  bool validateName(String name) {
    Pattern pattern = r'^[A-Za-z]+([ ][A-Za-z]+)*$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(name))
      return false;
    else
      return true;
  }

  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  bool validatePhone(String phone) {
    Pattern pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regex = new RegExp(pattern);

    if (!regex.hasMatch(phone))
      return false;
    else
      return true;
  }

  bool validateDob(String dob) {
    Pattern pattern =
        r'^([12]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[12]\d|3[01]))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(dob))
      return false;
    else
      return true;
  }
}
