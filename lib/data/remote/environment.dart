class Environments {
  // ignore: constant_identifier_names
  static const String PRODUCTION = 'https://ekompenpnj.my.id';
  // ignore: constant_identifier_names
  static const String DEV = 'http://192.168.100.136:8000';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': 'http://192.168.100.136:8000',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://ekompenpnj.my.id',
    },
  ];

  static String? getEnvironments() {
    return _availableEnvironments
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
