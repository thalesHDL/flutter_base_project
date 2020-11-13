import 'package:flutter_base_project/persistence/reflector/reflector.dart';

@reflector
class Entity {
  final String name;
  final String schema;

  const Entity({this.name, this.schema});
}
