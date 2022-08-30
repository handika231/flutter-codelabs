import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/db_provider.dart';
import 'note_add_view.dart';

class NoteListPage extends StatelessWidget {
  const NoteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Consumer<DbProvider>(
        builder: (context, provider, child) {
          final notes = provider.notes;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Dismissible(
                key: Key(note.id.toString()),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  // TODO : Kode untuk menghapus note
                  provider.deleteNote(note.id!);
                },
                child: Card(
                  child: ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.description),
                    onTap: () async {
                      // TODO : Kode untuk mendapatkan note yang dipilih dan dikirimkan ke NoteAddUpdatePage
                      final navigator = Navigator.of(context);
                      final selectedNote = await provider.getNoteById(note.id!);
                      navigator.push(
                        MaterialPageRoute(
                          builder: (context) => NoteAddUpdatePage(
                            note: selectedNote,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteAddUpdatePage(),
            ),
          );
        },
      ),
    );
  }
}
