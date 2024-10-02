import 'notes_list_route.dart';

class NoteRoute {
  static const String idKeyArg = 'id';
  static const String nameWithoutArgs = 'note';
  static const String name = 'note';

  static String getRouteWithArgs(int id){
    return '${NotesListRoute.name}$nameWithoutArgs?$idKeyArg=$id'; // identical to -> if(id == 5) then  '/note/5'
  }
}