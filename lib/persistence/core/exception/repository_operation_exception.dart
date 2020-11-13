class RepositoryOperationException implements Exception {
  String cause;
  RepositoryOperationException(this.cause);
}
