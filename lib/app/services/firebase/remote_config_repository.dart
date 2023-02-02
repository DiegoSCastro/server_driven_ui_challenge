abstract class RemoteConfigRepository {
  Future<void> init();
  // Future<String?> getFirebaseAuthToken();
  // Future<String?> getFirebaseId();
  Future<void> setConfigSettings();
  Future<void> setDefaults();
  Future<bool> fetchAndActivate();
  String getString(String key);
  bool getBool(String key);
  int getInt(String key);
  double getDouble(String key);
}
