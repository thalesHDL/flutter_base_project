import 'package:flutter_base_project/persistence/core/repository/async_repository.dart';

abstract class SearchRepository<E, I, F> extends AsyncRepository<E, I> {
  Future<List<E>> search(F filter);
}
