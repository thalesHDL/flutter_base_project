import 'package:flutter/material.dart';
import 'package:flutter_base_project/persistence/repository/repository_operation_exception.dart';
import 'package:flutter_base_project/service/repository/user_repository.dart';
import 'package:flutter_base_project/service/domain/user.dart';

import 'main.reflectable.dart';

void main() {
  initializeReflectable();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    UserRepository repository = UserRepository();
    repository.singleUpdate(User(id: "1", name: "Teste"), "name").then((value) {
      print(value.toString());
    }).catchError((RepositoryOperationException error) {
      print(error.toString());
    });
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Text('Flutter Demo Home Page'),
    );
  }
}
