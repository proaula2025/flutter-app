class AuthController {
  final String predefinedUser = "user";
  final String predefinedPassword = "admin";

  bool login(String user, String password) {
    return user == predefinedUser && password == predefinedPassword;
  }
}
