import 'package:chattopic/model/enum/environment.dart';

class FlavourConfig {
  static Map<String, dynamic> _config = {};

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.debugConstants;
        break;
      case Environment.prod:
        _config = _Config.prodConstants;
        break;
    }
  }

  static String get getCurrentEnvironment {
    return _config[_Config.flavour] as String;
  }
}

class _Config {
  static const flavour = 'flavour';

  static const Map<String, dynamic> debugConstants = {
    flavour: 'dev',
  };

  static const Map<String, dynamic> prodConstants = {
    flavour: 'prod',
  };
}
