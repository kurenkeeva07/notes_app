import '../../../core/di/dependency_injection.dart';
import '../data/db/notes_db_service.dart';
import '../data/repository/notes_interactor.dart';
import '../data/repository/notes_local_reporitory_impl.dart';
import '../domain/repository/notes_local_repository.dart';
import '../presentation/cubit/notes_cubit.dart';

void initNotesModule(){
  getIt.registerLazySingleton(()=> NotesDbService(notesDatabase: getIt()));
  getIt.registerLazySingleton<NotesLocalRepository>(() => NotesLocalRepositoryImpl(notesDbService: getIt()));
  getIt.registerFactory(()=> NotesInteractor(notesLocalRepository: getIt()));
  getIt.registerFactoryParam((int? param1, param2)=> NoteCubit(notesInteractor: getIt(), id: param1));
}