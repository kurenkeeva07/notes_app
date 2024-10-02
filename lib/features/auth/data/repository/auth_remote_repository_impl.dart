import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notes/features/auth/data/repository/auth_remote_repository.dart';
import 'package:notes/features/auth/data/service/firebase_auth_service.dart';

class AuthRemoteRepositoryImpl implements AuthRemoteRepository {
  final FirebaseAuthService _authService;

  AuthRemoteRepositoryImpl({
    required FirebaseAuthService authService,
  }) : _authService = authService;

  @override
  Stream<User?> observeAuthState() {
    return _authService.observeAuthState();
  }

  @override
  Future<UserCredential> signInWithGoogle(OAuthCredential credential) async {
    return _authService.signInWithCredential(credential);
  }

  @override
  Future<UserCredential> signInWithCredential(OAuthCredential credential) async {
    return _authService.signInWithCredential(credential);
  }

  @override
  Future<OAuthCredential> getGoogleCredential() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return credential;
  }

  @override
  Future<void> logOut() {
    return _authService.logout();
  }
}