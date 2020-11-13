import 'package:flutter_base_project/persistence/core/exception/repository_operation_exception.dart';
import 'package:flutter_base_project/persistence/core/information/entity_information.dart';
import 'package:flutter_base_project/persistence/core/repository/search_repository.dart';
import 'package:flutter_base_project/persistence/core/util/response_status.dart';
import 'package:flutter_base_project/persistence/reflector/reflector.dart';
import 'package:http/http.dart';
import 'package:reflectable/mirrors.dart';

abstract class FirebaseRepository<E, I, F>
    implements SearchRepository<E, I, F> {
  String _projectId = "base-simple-flutter-project";
  String _baseUrl = "https://base-simple-flutter-project.firebaseio.com/";

  EntityInformation<E> entityInformation;

  void _checkResponse(Response response) {
    if (response.statusCode != ResponseStatus.OK) {
      // TODO: criar mensagem
      throw RepositoryOperationException("teste");
    }
  }

  void _checkEntityToSave(InstanceMirror entityInstance) {
    Object idValue = entityInstance.invokeGetter(entityInformation.idField);
    if (idValue != null) {
      // TODO: criar mensagem
      throw RepositoryOperationException("teste");
    }
  }

  void _checkEntityToUpdate(InstanceMirror entityInstance) {
    Object idValue = entityInstance.invokeGetter(entityInformation.idField);
    if (idValue == null) {
      // TODO: criar mensagem
      throw RepositoryOperationException("teste");
    }
  }

  void _checkEntityToFieldUpdate(InstanceMirror entityInstance) {
    Object idValue = entityInstance.invokeGetter(entityInformation.idField);
    if (idValue == null) {
      // TODO: criar mensagem
      throw RepositoryOperationException("teste");
    }
  }

  @override
  Future<E> save(E entity) async {
    InstanceMirror entityInstance = reflector.reflect(entity);
    _checkEntityToSave(entityInstance);

    String body = entityInformation.toJson(entity);
    String url = _baseUrl + entityInformation.entityName + ".json";

    Response response = await post(url, body: body);
    _checkResponse(response);

    print(response.body.toString());
    entityInstance.invokeSetter(entityInformation.idField, "1");
    return entityInstance.reflectee;
  }

  @override
  Future<E> update(E entity) async {
    InstanceMirror entityInstance = reflector.reflect(entity);
    _checkEntityToUpdate(entityInstance);

    String body = entityInformation.toJson(entity);
    String url = _baseUrl + entityInformation.entityName + ".json";

    Response response = await put(url, body: body);
    _checkResponse(response);

    return entity;
  }

  @override
  Future<E> fieldUpdate(E entity, String field) async {
    InstanceMirror entityInstance = reflector.reflect(entity);
    _checkEntityToFieldUpdate(entityInstance);

    Object idValue = entityInstance.invokeGetter(entityInformation.idField);
    String value = entityInstance.invokeGetter(field).toString();

    String body = "{\"$field\" : \"$value\"}";
    String url = _baseUrl +
        entityInformation.entityName +
        "/" +
        idValue.toString() +
        ".json";

    Response response = await patch(url, body: body);
    _checkResponse(response);

    return entity;
  }

  @override
  Future<void> delete(E entity) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteById(I id) {
    // TODO: implement deleteById
    throw UnimplementedError();
  }

  @override
  Future<List<E>> search(F filter) {
    // TODO: implement search
    throw UnimplementedError();
  }
}
