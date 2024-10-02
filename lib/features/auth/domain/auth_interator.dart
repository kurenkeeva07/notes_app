
import 'package:app_notes_app/features/auth/domain/repository/auth_local_reporitory.dart';
import 'package:firebase/firebase.dart';

import '../data/repository/auth_remote_repository.dart';

class AuthInteractor {
  final AuthRemoteRepository _remoteRepository;
  final AuthLocalRepository _localRepository;

  AuthInteractor({
    required AuthRemoteRepository remoteRepository,
    required AuthLocalRepository localRepository,
  })  : _remoteRepository = remoteRepository,
        _localRepository = localRepository;

  Stream<User?> observeUser() {
    return _remoteRepository.observeAuthState();
  }

  User? getUser() {
    return _localRepository.getUser();
  }

  void saveUser(User user) {
    _localRepository.saveUser(user);
  }

  Future<OAuthCredential> getGoogleCredential() {
    return _remoteRepository.getGoogleCredential();
  }

  Future<UserCredential> signInWithGoogle(OAuthCredential credential) {
    return _remoteRepository.signInWithGoogle(credential);
  }

  Future logOut() async{
    _localRepository.logOut();
    return _remoteRepository.logOut();
  }
}