import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_app/blocs/users_screen/users_screen_bloc.dart';
import 'package:user_info_app/blocs/users_screen/users_screen_event.dart';
import 'package:user_info_app/blocs/users_screen/users_screen_state.dart';
import 'package:user_info_app/domain/entity/user_info_entity.dart';
import 'package:user_info_app/domain/repository/user_info_repository.dart';
import 'package:user_info_app/screens/user_info/user_info.dart';
import 'package:user_info_app/screens/user_info_form_screen/user_info_form_screen.dart';

class UsersScreen extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (BuildContext context) => UsersScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UsersScreenBloc(
          userInfoRepository:
              RepositoryProvider.of<UserInfoRepository>(context))
        ..add(UsersScreenGetAllUsersEvent()),
      child: BlocBuilder<UsersScreenBloc, UsersScreenState>(
        builder: (BuildContext context, UsersScreenState state) {
          if (state is UsersScreenInitialState) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Users",
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  FlatButton(
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(UserInfoFormScreen.route());
                    },
                    child: Icon(Icons.add),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  ),
                ],
              ),
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state is UsersScreenSuccessState) {
            return Scaffold(
                appBar: AppBar(
                  title: Text(
                    "Users",
                    style: TextStyle(color: Colors.white),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).push(UserInfoFormScreen.route());
                      },
                      child: Icon(Icons.add),
                      shape: CircleBorder(
                          side: BorderSide(color: Colors.transparent)),
                    ),
                  ],
                ),
                body: state.users.length == 0
                    ? Center(child: Text("No User Added"))
                    : userListWidget(context, state.users));
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "Users",
                  style: TextStyle(color: Colors.white),
                ),
                actions: <Widget>[
                  FlatButton(
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(UserInfoFormScreen.route());
                    },
                    child: Icon(Icons.add),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  ),
                ],
              ),
              body: Center(child: Text("Something went wrong")),
            );
          }
        },
      ),
    );
  }

  Widget userListWidget(BuildContext context, List<UserInfoEntity> users) {
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(UserInfoScreen.route(users[index]));
            },
            child: ListTile(
              title: Text(users[index].name),
            ),
          );
        });
  }
}
