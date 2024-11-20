import 'package:flutter/material.dart';
import '../database_helper.dart';
import '../widgets/note_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> notes = [];

  @override
  void initState() {
    super.initState();
    _loadNotes();
  }

  Future<void> _loadNotes() async {
    final data = await DatabaseHelper.instance.getNotes();
    setState(() {
      notes = data.map((note) {
        return {
          ...note,
          'created_at': _formatDate(note['created_at']),
        };
      }).toList();
    });
  }


  String _formatDate(String isoDate) {
    final dateTime = DateTime.parse(isoDate);
    return '${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}-${dateTime.year} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _addNote(String text) async {
    await DatabaseHelper.instance.insertNote(text);
    _loadNotes();
  }

  Future<void> _deleteNoteById(int id) async {
    await DatabaseHelper.instance.deleteNoteById(id);
    _loadNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Column(
        children: [
          NoteForm(onSubmit: _addNote),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note['text']),
                  subtitle: Text(note['created_at']),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteNoteById(note['id']),
                  ),
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
