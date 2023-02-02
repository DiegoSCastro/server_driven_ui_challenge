import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:server_driven_ui_challenge/app/services/firebase/remote_config_repository.dart';

class RemoteConfigImpl implements RemoteConfigRepository {
  static const forceFetching = false;
  bool fetching = false;
  late final FirebaseRemoteConfig _sdk;
  FirebaseRemoteConfig get sdk => _sdk;
  RemoteConfigFetchStatus get lastFetchStatus => _sdk.lastFetchStatus;
  DateTime get lastFetchTime => _sdk.lastFetchTime;

  RemoteConfigValue getValue(String key) {
    return _sdk.getValue(key);
  }

  @override
  Future<void> init() async {
    _sdk = FirebaseRemoteConfig.instance;
    await setConfigSettings();
    await setDefaults();
  }

  @override
  Future<bool> fetchAndActivate() async {
    if (fetching) return false;
    fetching = true;
    final updated = await _sdk.fetchAndActivate();
    fetching = false;
    return updated;
  }

  @override
  Future<void> setConfigSettings() async {
    await _sdk.setConfigSettings(
      RemoteConfigSettings(
        minimumFetchInterval: const Duration(seconds: 1),
        fetchTimeout: const Duration(seconds: 12),
      ),
    );
  }

  @override
  Future<void> setDefaults() async {
    final defaults = {
      "home": await rootBundle.loadString('assets/json_pages/home.json'),
      "pix_limit": await rootBundle.loadString('assets/json_pages/pix_limit.json'),
    };
    await _sdk.setDefaults(defaults);
    RemoteConfigValue(null, ValueSource.valueStatic);
  }

  @override
  String getString(String key) {
    return _sdk.getString(key);
  }

  @override
  bool getBool(String key) {
    return _sdk.getBool(key);
  }

  @override
  int getInt(String key) {
    return _sdk.getInt(key);
  }

  @override
  double getDouble(String key) {
    return _sdk.getDouble(key);
  }
}
