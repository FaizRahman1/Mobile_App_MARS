class MarsApiConfig {
  const MarsApiConfig._();

  /// Android Emulator routes 10.0.2.2 to the development computer.
  static const String baseUrl = String.fromEnvironment(
    'MARS_API_BASE_URL',
    defaultValue: 'http://10.0.2.2:5112',
  );

}
