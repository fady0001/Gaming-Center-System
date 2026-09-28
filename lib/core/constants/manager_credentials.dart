
class ManagerCredentials {
  ManagerCredentials._();

  static const String username = 'fadi';
  static const String password = '2004@';


  static bool matches({required String username, required String password}) {
    return username == ManagerCredentials.username &&
        password == ManagerCredentials.password;
  }
}
