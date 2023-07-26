import 'package:flutter/material.dart';
import '../entry.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  List<Entry> entries = [
    Entry(text: 'Groceries', value: '-300'),
    Entry(text: 'Bills', value: '-1000'),
    Entry(text: 'Salary', value: '50000')
  ];

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
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Card(
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(
                    letterSpacing: 1.5,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(width: 150.0),
                const Text(
                  '48700',
                  style: TextStyle(
                    letterSpacing: 1.2,
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 80.0,
            color: Colors.grey[800],
          ),
          Column(
            children: entries.map((entry) => EntryCard(
              entry: entry,
              delete: () {
                  setState(() {
                    entries.remove(entry);
                  });
              }
            )).toList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

          final textController1 = TextEditingController();
          final textController2 = TextEditingController();

          String text = 'null';
          String value = '0';

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.purpleAccent[100],
              title: const Center(child: Text('New Entry')),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: textController1,
                    onChanged: (text) {
                      text = textController1.text;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the Category",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          textController1.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: textController2,
                    onChanged: (value) {
                      value = textController2.text;
                    },
                    decoration: InputDecoration(
                      hintText: "Enter the Price",
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          textController2.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  )
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    text = textController1.text;
                    value = textController2.text;
                    Entry entry = Entry(text: text, value: value);
                    Navigator.pop(context);
                    setState(() {
                      entries.add(entry);
                    });
                  },
                  child: const Text('Done'),
                ),
              ],
              // shape: Border.symmetric(),
              // backgroundColor: Colors.purpleAccent[600],
              // child: Column(
              //   children: [
              //     const Center(child: Text('New Entry')),
              //     Divider(
              //       height: 50.0,
              //       color: Colors.grey[800],
              //     ),
              //     const Text('Category'),
              //     const SizedBox(height: 30.0),
              //     const Text('Price'),
              //     const SizedBox(height: 10.0),
              //     FloatingActionButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       child: const Icon(Icons.done),
              //     ),
              //   ],
              // ),
            )
          );
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

class EntryCard extends StatelessWidget {

  final Entry entry;
  final VoidCallback delete;
  const EntryCard({super.key,  required this.entry, required this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 8.0),
          Text(
            entry.text,
            style: const TextStyle(
              fontSize: 17.0,
              color: Colors.black54,
              letterSpacing: 1.4,
            ),
          ),
          const SizedBox(width: 150.0),
          Text(
            entry.value,
            style: const TextStyle(
              letterSpacing: 1.2,
              color: Colors.black87,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(width: 4.0),
          IconButton(
            onPressed: delete,
            icon: const Icon(
              Icons.delete,
              size: 35.0,
            ),
          ),
        ],
      ),
    );
  }
}
