import 'package:flutter/material.dart';
import 'models/note.dart';
import 'edit_note_page.dart';

void main() {
  runApp(const SimpleNotesApp());
}

class SimpleNotesApp extends StatelessWidget {
  const SimpleNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes',
      theme: ThemeData(useMaterial3: true),
      home: const NotesPage(),
    );
  }
}

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final List<Note> _notes = [
    Note(id: '1', title: 'Пример', body: 'Это пример заметки'),
  ];

  String _searchQuery = '';

  List<Note> get _filteredNotes {
    if (_searchQuery.isEmpty) return _notes;
    final q = _searchQuery.toLowerCase();
    return _notes.where((n) => n.title.toLowerCase().contains(q)).toList();
  }

  Future<void> _addNote() async {
    final newNote = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => const EditNotePage()),
    );
    if (newNote != null) {
      setState(() => _notes.add(newNote));
    }
  }

  Future<void> _edit(Note note) async {
    final updated = await Navigator.push<Note>(
      context,
      MaterialPageRoute(builder: (_) => EditNotePage(existing: note)),
    );
    if (updated != null) {
      setState(() {
        final i = _notes.indexWhere((n) => n.id == updated.id);
        if (i != -1) {
          _notes[i] = updated;
        }
      });
    }
  }

  void _delete(Note note) {
    setState(() {
      _notes.removeWhere((n) => n.id == note.id);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Заметка удалена')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: 'Поиск по заголовку...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNote,
        child: const Icon(Icons.add),
      ),
      body: _filteredNotes.isEmpty
          ? const Center(child: Text('Пока нет заметок. Нажмите +'))
          : ListView.builder(
              itemCount: _filteredNotes.length,
              itemBuilder: (context, i) {
                final note = _filteredNotes[i];
                return Dismissible(
                  key: ValueKey(note.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    color: Colors.redAccent,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) => _delete(note),
                  child: ListTile(
                    title: Text(
                      note.title.isEmpty ? '(без названия)' : note.title,
                    ),
                    subtitle: Text(
                      note.body,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () => _edit(note),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _delete(note),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
