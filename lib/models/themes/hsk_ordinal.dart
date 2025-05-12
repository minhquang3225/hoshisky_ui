
abstract class HskOrdinal<T> {
  List<T> get values;
  T get primary => values.isNotEmpty ? values[0] : throw RangeError('No primary value found');
  T get secondary => values.length > 1 ? values[1] : throw RangeError('No secondary value found');
  T get tertiary => values.length > 2 ? values[2] : throw RangeError('No tertiary value found');
  T get quaternary => values.length > 3 ? values[3] : throw RangeError('No quaternary value found');
  T get quinary => values.length > 4 ? values[4] : throw RangeError('No quinary value found');
}