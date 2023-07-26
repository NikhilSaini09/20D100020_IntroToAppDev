import 'package:flutter/material.dart';
import '../entry.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        children: <Widget>[
          const SizedBox(height: 30.0),
          const Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.jpg'),
              radius: 50.0,
            ),
          ),
          Divider(
            height: 70.0,
            color: Colors.grey[800],
          ),
          const Text(
            'Welcome',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            'Back!',
            style: TextStyle(
              color: Colors.black,
              letterSpacing: 2.0,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 80.0),
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
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(width: 150.0),
                const Text(
                  '48700',
                  style: TextStyle(
                    letterSpacing: 1.2,
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/list');
                  },
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    size: 35.0,
                  ),
                ),
              ],
            ),
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
                      Navigator.pop(context);
                      Entry entry = Entry(text: text, value: value);
                      //entries.add(entry);
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
