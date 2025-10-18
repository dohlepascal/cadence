import 'package:shared_preferences/shared_preferences.dart';

class TimerRepository {
  static const _workKey = 'work';
  static const _restKey = 'rest';
  static const _roundsKey = 'rounds';
  static const _themeKey = 'theme';

  Future<void> saveTimerSettings({
    required int workSeconds,
    required int restSeconds,
    required int rounds,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_workKey, workSeconds);
    await prefs.setInt(_restKey, restSeconds);
    await prefs.setInt(_roundsKey, rounds);
  }

  Future<Map<String, int>> loadTimerSettings() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'work': prefs.getInt(_workKey) ?? 30,
      'rest': prefs.getInt(_restKey) ?? 10,
      'rounds': prefs.getInt(_roundsKey) ?? 6,
    };
  }

  Future<void> saveTheme(String themeKey) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, themeKey);
  }

  Future<String?> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_themeKey);
  }
}
