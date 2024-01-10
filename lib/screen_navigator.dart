import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo({required this.title, required this.description});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Passing Data',
      home: Todos(
        todos: List.generate(
          20,
          (i) => Todo(
            description: 'A description of what needs to be done for Todo $i',
            title: 'Todo $i',
          ),
        ),
      ),
    );
  }
}

class Todos extends StatelessWidget {
  const Todos({super.key, required this.todos});
  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailScreen(todo: todos[index])),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.todo});
  final Todo todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(child: Text(todo.description))),
    );
  }
}
