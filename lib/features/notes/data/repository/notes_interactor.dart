import 'dart:core';
import '../../domain/repository/notes_local_repository.dart';
import 'note.dart';

class NotesInteractor {
  NotesInteractor({
    required NotesLocalRepository notesLocalRepository,
  }) : _notesLocalRepository = notesLocalRepository;

  final NotesLocalRepository _notesLocalRepository;

  Future<int> saveNote(Note note){
    return _notesLocalRepository.saveNote(note);
  }

  Future<List<Note>> getNotes(){
    return _notesLocalRepository.getNotes();
  }

  Future<Note?> getNoteById(int id){
    return _notesLocalRepository.getNoteById(id);
  }

}