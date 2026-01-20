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
    return MaterialApp(home: Scaffold());
  }
}

// class GenesisPage extends StatefulWidget {}

// class _GenesisPageState extends State<GenesisPage> {
//   String verseText = '';
//   String verseRef = '';
//   DateTime? createdAt;
// }
