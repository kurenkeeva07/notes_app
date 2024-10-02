import '../../../core/di/dependency_injection.dart';

void initAuthModule() {
  getIt.registerLazySingleton(() => FirebaseAuthService());
  getIt.registerLazySingleton<AuthRemoteRepository>(() => AuthRemoteRepositoryImpl(authService: getIt()));
  getIt.registerLazySingleton<AuthLocalRepository>(() => AuthLocalRepositoryImpl());
  getIt.registerFactory(() => AuthInteractor(remoteRepository: getIt(), localRepository: getIt()));
  getIt.registerFactory(() => AuthBloc(authInteractor: getIt()));
}