/*
Genesis is The First App.
Phase 0: Capture verse text and reference inputs while ensuring automatic time tracking and layout integrity. 

Phase 1: Build a single-screen application structured as MaterialApp → Scaffold → VerseInputScreen.

Phase 2: Implement a StatefulWidget at the screen level to manage the transition from Input State to Display State.

Phase 3: Establish a reactive data flow where User Input triggers a State Update and a subsequent UI Rebuild.

Phase 4: Integrate asynchronous functionality by handling timestamp generation using DateTime.now().

Phase 5: Assemble the UI using MaterialApp, Scaffold, Column, TextFields, Buttons, and FutureBuilder for async data.
*/
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //constructor
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: GenesisScreen());
  }
}

class GenesisScreen extends StatefulWidget {
  const GenesisScreen({super.key});
  @override
  State<GenesisScreen> createState() => _GenesisScreenState();
}

class _GenesisScreenState extends State<GenesisScreen> {
  String _verse = '';
  String _reference = '';
  DateTime? _createdAt;
  final TextEditingController _verseController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  Future<String> _formatTimestamp(DateTime time) async {
    await Future.delayed(const Duration(seconds: 3));
    return '${time.toLocal().hour}:${time.toLocal().minute}:${time.toLocal().second}';
  }

  @override
  void dispose() {
    _verseController.dispose();
    _referenceController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Genesis')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _verseController,
              decoration: const InputDecoration(labelText: 'Verse'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _referenceController,
              decoration: const InputDecoration(labelText: 'Reference'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _verse = _verseController.text;
                  _reference = _referenceController.text;
                  _createdAt = DateTime.now();
                });
              },
              child: const Text('Create Verse Ahora'),
            ),
            if (_verse.isNotEmpty && _reference.isNotEmpty) ...[
              const SizedBox(height: 24),
              Text(
                _verse,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                '- $_reference',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
              if (_createdAt != null)
                Text(
                  'Created at: ${_createdAt!.toLocal()}',
                  style: const TextStyle(fontSize: 12),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
