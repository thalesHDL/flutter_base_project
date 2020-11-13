abstract class AsyncRepository<E, I> {
  Future<E> save(E entity);

  Future<E> update(E entity);

  Future<E> fieldUpdate(E entity, String field);

  Future<void> delete(E entity);

  Future<void> deleteById(I id);
}
