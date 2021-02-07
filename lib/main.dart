import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_info_app/data/data.dart';
import 'package:user_info_app/domain/repository/user_info_repository.dart';
import 'package:user_info_app/screens/user_info_form_screen/user_info_form_screen.dart';
import 'package:user_info_app/screens/users_screen/UsersScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Data data = Data.instance;
  await data.initDatabase();

  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(
        create: (BuildContext context) =>
            UserInfoRepository(userInfoService: data.userInfoService()))
  ], child: App()));
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Info App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: UsersScreen(),
    );
  }
}
