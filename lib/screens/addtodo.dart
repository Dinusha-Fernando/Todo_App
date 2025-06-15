import 'package:flutter/material.dart';

class Addtodo extends StatefulWidget {
  const Addtodo({super.key});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Todo')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add Todo',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String text = _controller.text.trim();
                debugPrint("Adding todo: $text");
                if (text.isNotEmpty) {
                  Navigator.pop(context, text);
                }
              },
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
