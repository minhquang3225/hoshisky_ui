enum HskStateKey {
  base,
  disabled,
  pressed,
  hovered,
  focused,
  enabled,
  loading,
  selected,
  highlighted,
  error,
}

abstract class HskState<T> {
  Map<HskStateKey, T> get stateMap;

  T get base => _get(HskStateKey.base);
  T get disabled => _get(HskStateKey.disabled);
  T get pressed => _get(HskStateKey.pressed);
  T get hovered => _get(HskStateKey.hovered);
  T get focused => _get(HskStateKey.focused);
  T get enabled => _get(HskStateKey.enabled);
  T get loading => _get(HskStateKey.loading);
  T get selected => _get(HskStateKey.selected);
  T get highlighted => _get(HskStateKey.highlighted);
  T get error => _get(HskStateKey.error);

  T _get(HskStateKey key) {
    if (!stateMap.containsKey(key)) {
      throw ArgumentError('State "$key" not found in stateMap');
    }
    return stateMap[key]!;
  }
}
