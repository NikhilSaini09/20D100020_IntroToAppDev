import 'package:flutter/material.dart';

class Entry extends StatefulWidget {
  const Entry({super.key});

  @override
  State<Entry> createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[400],
        title: Text(
          'Budget Tracker',
          style: TextStyle(
              color: Colors.blue[100],
              letterSpacing: 1.5
          ),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: const Text('body'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/entry');
        },
        tooltip: 'New Entry',
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
