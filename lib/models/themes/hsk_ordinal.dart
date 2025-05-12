enum HskOrdinalKey {
  primary,
  secondary,
  tertiary,
  quaternary,
  quinary,
  senary,
  septenary,
  octonary,
  nonary,
  denary,
}

abstract class HskOrdinal<T> {
  Map<HskOrdinalKey, T> get values;

  T get primary => _get(HskOrdinalKey.primary);
  T get secondary => _get(HskOrdinalKey.secondary);
  T get tertiary => _get(HskOrdinalKey.tertiary);
  T get quaternary => _get(HskOrdinalKey.quaternary);
  T get quinary => _get(HskOrdinalKey.quinary);
  T get senary => _get(HskOrdinalKey.senary);
  T get septenary => _get(HskOrdinalKey.septenary);
  T get octonary => _get(HskOrdinalKey.octonary);
  T get nonary => _get(HskOrdinalKey.nonary);
  T get denary => _get(HskOrdinalKey.denary);

  T _get(HskOrdinalKey key) =>
      values[key] ?? (throw StateError('No value found for $key in HskOrdinal'));
}
