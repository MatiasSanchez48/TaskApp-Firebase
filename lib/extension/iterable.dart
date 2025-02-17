/// {@template FirstWhereOrNull}
/// TODO: Add description.
/// {@endtemplate}
extension FirstWhereOrNull<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E element) test) {
    for (final e in this) {
      if (test(e)) return e;
    }
    return null;
  }
}
