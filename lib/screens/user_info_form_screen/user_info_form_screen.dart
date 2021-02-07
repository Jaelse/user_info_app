import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_app/blocs/user_info_form_screen/user_info_form_screen_bloc.dart';
import 'package:user_info_app/blocs/user_info_form_screen/user_info_form_screen_event.dart';
import 'package:user_info_app/blocs/user_info_form_screen/user_info_form_screen_state.dart';
import 'package:user_info_app/domain/repository/user_info_repository.dart';
import 'package:user_info_app/screens/users_screen/UsersScreen.dart';

class UserInfoFormScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(
        builder: (BuildContext context) =>
            UserInfoFormScreen(title: 'User Info Form'));
  }

  UserInfoFormScreen({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserInfoFormScreenBloc(
          userInfoRepository:
              RepositoryProvider.of<UserInfoRepository>(context)),
      child: BlocListener<UserInfoFormScreenBloc, UserInfoFormScreenState>(
        listener: (BuildContext context, UserInfoFormScreenState state) {
          if (state is UserInfoFormInitialState) {
            if (state.userInfoSubmitted) {
              Navigator.pushAndRemoveUntil(
                  context, UsersScreen.route(), (route) => false);
            }
          }
        },
        child: BlocBuilder<UserInfoFormScreenBloc, UserInfoFormScreenState>(
          builder: (BuildContext context, UserInfoFormScreenState state) {
            if (state is UserInfoFormInitialState) {
              Color nameColor = state.nameIsValid ? Colors.black : Colors.red;
              Color emailColor = state.emailIsValid ? Colors.black : Colors.red;
              Color dobColor = state.dobIsValid ? Colors.black : Colors.red;
              Color phoneColor =
                  state.phoneNoIsValid ? Colors.black : Colors.red;

              return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                ),
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          width: double.infinity,
                          child: Text("Name:"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: nameColor,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: nameColor,
                                  width: 1.0,
                                ),
                              ),
                              border: InputBorder.none,
                              labelText: 'John Sam Bing',
                            ),
                            onChanged: (String name) {
                              context
                                  .read<UserInfoFormScreenBloc>()
                                  .add(UserInfoFormOnNameChangedEvent(name));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          width: double.infinity,
                          child: Text("Email:"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: emailColor,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: emailColor,
                                  width: 1.0,
                                ),
                              ),
                              labelText: 'something@abs.com',
                            ),
                            onChanged: (String email) {
                              context
                                  .read<UserInfoFormScreenBloc>()
                                  .add(UserInfoFormOnEmailChangedEvent(email));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          width: double.infinity,
                          child: Text("Phone Number:"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: phoneColor,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: phoneColor,
                                  width: 1.0,
                                ),
                              ),
                              border: InputBorder.none,
                              labelText: '+(123)-456-78-90',
                            ),
                            onChanged: (String number) {
                              context.read<UserInfoFormScreenBloc>().add(
                                  UserInfoFormOnNumberChangedEvent(number));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8.0),
                          width: double.infinity,
                          child: Text("Date of Birth:"),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: dobColor,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(0.0),
                                ),
                                borderSide: new BorderSide(
                                  color: dobColor,
                                  width: 1.0,
                                ),
                              ),
                              border: InputBorder.none,
                              labelText: 'YYYY-MM-DD',
                            ),
                            onChanged: (String dob) {
                              context
                                  .read<UserInfoFormScreenBloc>()
                                  .add(UserInfoFormOnDobChangedEvent(dob));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RaisedButton(
                          onPressed: () {
                            context
                                .read<UserInfoFormScreenBloc>()
                                .add(UserInfoFormOnSubmitEvent());
                          },
                          color: Colors.orange,
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Scaffold(
                appBar: AppBar(
                  title: Text(title),
                ),
                body: Center(
                  child: Text(
                    'Something went wrong',
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
