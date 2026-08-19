import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'counter_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  CounterModel counter = CounterModel();

  Future<void> _saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('counter', counter.count);
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter.count = prefs.getInt('counter') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Counter Demo',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${counter.count}',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 64,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: ButtonStyle(
                    side: WidgetStateProperty.all(
                      BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      counter.decrementCounter();
                    });
                  },
                  icon: Icon(Icons.remove, color: Colors.white),
                ),
                SizedBox(width: 16),
                IconButton(
                  style: ButtonStyle(
                    side: WidgetStateProperty.all(
                      BorderSide(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      counter.incrementCounter();
                    });
                  },
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                _saveCounter();
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Counter saved!')));
              },
              child: Text(
                'Save Counter',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
