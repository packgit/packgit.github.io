import 'package:shared_preferences/shared_preferences.dart';

/// Persists the set of completed strategy ids (backed by browser localStorage
/// on Flutter Web).
class ProgressStorage {
  ProgressStorage(this._prefs);

  static const _key = 'boostapp.completed_strategy_ids.v1';

  final SharedPreferences _prefs;

  static Future<ProgressStorage> open() async =>
      ProgressStorage(await SharedPreferences.getInstance());

  Set<String> load() =>
      (_prefs.getStringList(_key) ?? const <String>[]).toSet();

  Future<void> save(Set<String> completedIds) =>
      _prefs.setStringList(_key, completedIds.toList()..sort());
}
