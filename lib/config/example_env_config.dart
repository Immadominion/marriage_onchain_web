class EnvConfig {
  static const String infuraKey = String.fromEnvironment(
    'INFURA_KEY',
    defaultValue: 'YOUR_FALLBACK_INFURA_KEY',
  );
}