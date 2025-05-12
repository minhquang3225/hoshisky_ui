enum HskSizeKey { extraSmall, small, medium, large, extraLarge }

abstract class HskSize<T> {
  Map<HskSizeKey, T> get sizeMap;

  T get extraSmall => _get(HskSizeKey.extraSmall);
  T get small => _get(HskSizeKey.small);
  T get medium => _get(HskSizeKey.medium);
  T get large => _get(HskSizeKey.large);
  T get extraLarge => _get(HskSizeKey.extraLarge);

  T _get(HskSizeKey key) {
    if (!sizeMap.containsKey(key)) {
      throw ArgumentError('Size "$key" not found in sizeMap');
    }
    return sizeMap[key]!;
  }
}
