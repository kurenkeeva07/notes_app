import '../../../core/di/dependency_injection.dart';
import '../presentation/bloc/notes_list_bloc.dart';

void initNotesListModule() {
  getIt.registerFactory(() => NotesListBloc(notesInteractor: getIt()));
}