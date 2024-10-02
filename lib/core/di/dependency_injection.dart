import 'package:get_it/get_it.dart';
import '../../features/home/di/home_module.dart';
import '../../features/notes/di/notes_module.dart';
import '../../features/notes_list/di/notes_list_module.dart';
import 'core_module.dart';

final getIt = GetIt.instance;

void initDependencyInjection(){
  initCoreModule();
  initHomeModule();
  initNotesModule();
  initNotesListModule();
}