import 'package:flutter_base_project/persistence/core/information/entity_information.dart';

abstract class EntityInformationProvider<E extends EntityInformation> {
  E newInstance<T>();
}
