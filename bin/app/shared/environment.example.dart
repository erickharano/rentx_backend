class EnvironmentExample {
  const EnvironmentExample._();

  static String get jwtissuer => "http://google.com";
  static String get keySeg => "matrix";

  static String get _user => "root";
  static String get _pass => "";
  static String get _database => "";

  static String get urlAccess => "mongodb+srv://$_user:$_pass@cluster0.ptivc.mongodb.net/$_database?retryWrites=true&w=majority";
}
