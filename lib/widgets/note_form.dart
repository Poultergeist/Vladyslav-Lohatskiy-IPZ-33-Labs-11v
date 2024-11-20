import 'package:flutter/material.dart';

class NoteForm extends StatefulWidget {
  final Function(String) onSubmit;

  const NoteForm({super.key, required this.onSubmit});

  @override
  State<NoteForm> createState() => _NoteFormState();
}

class _NoteFormState extends State<NoteForm> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onSubmit(_controller.text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Enter a note',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Note cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
