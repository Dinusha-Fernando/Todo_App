import 'package:flutter/material.dart';
import 'package:todoapp/screens/addtodo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> todos = [];

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _navigateAndAddTodo() async {
    final newTodo = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Addtodo()),
    );

    debugPrint("Returned todo: $newTodo");

    if (newTodo != null && newTodo is String && newTodo.trim().isNotEmpty) {
      setState(() {
        todos.add(newTodo);
      });
      debugPrint("Current todos: $todos");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: todos.isEmpty
          ? const Center(child: Text('No todos yet. Add one!'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                debugPrint("Rendering todo: ${todos[index]}");
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                  child: ListTile(
                    title: Text(
                      todos[index],
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => deleteTodo(index),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAndAddTodo,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
