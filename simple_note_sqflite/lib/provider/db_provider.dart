import 'package:flutter/foundation.dart';
import 'package:simple_note_sqflite/utils/database_helper.dart';

import '../model/note.dart';

class DbProvider extends ChangeNotifier {
  final List<Note> _notes = [];
  DatabaseHelper? _databaseHelper;
  List<Note> get notes => _notes;
  DbProvider() {
    _databaseHelper = DatabaseHelper();
    _getAllNote();
  }

  _getAllNote() {
    _databaseHelper?.getAllNotes().then((notes) {
      _notes.clear();
      _notes.addAll(notes);
      notifyListeners();
    });
  }

  Future addNote(Note note) async {
    await _databaseHelper?.addNote(note);
    _getAllNote();
  }

  Future getNoteById(int id) async {
    return await _databaseHelper?.getNoteById(id);
  }

  Future updateNote(Note note) async {
    await _databaseHelper?.updateNote(note);
    _getAllNote();
  }

  Future deleteNote(int id) async {
    await _databaseHelper?.deleteNote(id);
    _getAllNote();
  }
}
