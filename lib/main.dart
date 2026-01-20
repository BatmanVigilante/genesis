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
  final TextEditingController _verseController = TextEditingController();
  final TextEditingController _referenceController = TextEditingController();
  @override
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
          ],
        ),
      ),
    );
  }
}
