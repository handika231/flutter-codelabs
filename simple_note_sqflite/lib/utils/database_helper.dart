import 'package:path/path.dart';
import 'package:simple_note_sqflite/model/note.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  //create singleton
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();
  factory DatabaseHelper() => instance;

  static late Database _database;
  Future<Database> get database async {
    _database = await _initDatabase();
    return _database;
  }

  static const String _tableName = 'notes';

  Future<Database> _initDatabase() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'notes.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (id INTEGER PRIMARY KEY, title TEXT, description TEXT)''',
        );
      },
    );
    return db;
  }

  //create add data
  Future addNote(Note note) async {
    var db = await database;
    var result = await db.insert(
      _tableName,
      note.toMap(),
    );
    return result;
  }

  Future<List<Note>> getAllNotes() async {
    var db = await database;
    var result = await db.query(_tableName);
    return result.map((note) => Note.fromMap(note)).toList();
  }

  //create get data by id
  Future<Note> getNoteById(int id) async {
    var db = await database;
    var result = await db.query(_tableName, where: 'id = ?', whereArgs: [id]);
    return result.map((note) => Note.fromMap(note)).first;
  }

  //create update data
  Future updateNote(Note note) async {
    var db = await database;
    var result = await db.update(
      _tableName,
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
    return result;
  }

  //create delete data
  Future deleteNote(int id) async {
    var db = await database;
    var result = await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }
}
