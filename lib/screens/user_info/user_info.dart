import 'package:flutter/material.dart';
import 'package:user_info_app/domain/entity/user_info_entity.dart';

class UserInfoScreen extends StatelessWidget {
  static Route route(UserInfoEntity user) {
    return MaterialPageRoute(
        builder: (BuildContext context) =>
            UserInfoScreen(userInfoEntity: user));
  }

  final UserInfoEntity userInfoEntity;

  UserInfoScreen({this.userInfoEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    "Name: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    userInfoEntity.name,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Email: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    userInfoEntity.email,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Phone Number: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    userInfoEntity.phone,
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Text(
                    "Date of birth: ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    userInfoEntity.dob.year.toString() +
                        "-" +
                        userInfoEntity.dob.month.toString() +
                        " " +
                        userInfoEntity.dob.day.toString(),
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
