import 'package:reflectable/mirrors.dart';

abstract class EntityInformation<E> {
  ClassMirror entityClass;
  String idField;
  bool idIsAutoGenerated;
  String entityName;
  List<String> columns;

  String toJson<E>(E entity);
  E fromJson<E>(String jsonStr);

  EntityInformation(
      {this.entityClass,
      this.idField,
      this.idIsAutoGenerated,
      this.entityName,
      this.columns});
}