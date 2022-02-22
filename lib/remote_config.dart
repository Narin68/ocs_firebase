import 'package:firebase_remote_config/firebase_remote_config.dart';

class OCSFbConfig {
  final Duration? fetchTimeout;
  final Duration? minimumFetchInterval;

  OCSFbConfig({this.fetchTimeout, this.minimumFetchInterval});

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  Future<String> getString(String key) async {
    await _remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: fetchTimeout ?? const Duration(seconds: 10),
      minimumFetchInterval: minimumFetchInterval ?? const Duration(hours: 1),
    ));

    await _remoteConfig.fetchAndActivate();

    return _remoteConfig.getString(key);
  }
}
