import 'package:flutter/cupertino.dart';
import '../../domain/repository/notes_local_repository.dart';
import '../db/models/note_entity.dart';
import '../db/notes_db_service.dart';
import 'note.dart';


class NotesLocalRepositoryImpl implements NotesLocalRepository {
  final NotesDbService _notesDbService;

  NotesLocalRepositoryImpl({required NotesDbService notesDbService})
      : _notesDbService = notesDbService;

  Future<int> saveNote(Note note) {
    NoteEntity entity = NoteEntity( title: note.title, content: note.content);
    final id = _notesDbService.insertNote(entity);
    debugPrint('### saveNote -> id: $id');
    return id;
  }

  Future<Note?> getNoteById(int id) {
    final entity = _notesDbService.getNoteById(id);
    return entity.then((e) => e == null ? null : Note(id: e.id, title: e.title, content: e.content));
  }

  @override
  Future<List<Note>> getNotes() {
    final entities = _notesDbService.getNotes();
    return entities
        .then((list) => list.map((e) => Note(id: e.id ,title: e.title, content: e.content)).toList());
  }
}