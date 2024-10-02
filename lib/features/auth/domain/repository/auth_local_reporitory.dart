abstract class AuthLocalRepository {
  Stream<User?> get userStream;

  void saveUser(User user);
  User? getUser();
  void logOut();
}