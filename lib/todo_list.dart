import 'package:flutter/material.dart';

class TodoListWidget extends StatefulWidget {
  const TodoListWidget({super.key});

  @override
  State<TodoListWidget> createState() => _TodoListWidgetState();
}

class _TodoListWidgetState extends State<TodoListWidget> {
  var editingController = TextEditingController();

  var todos = <String>[];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Enter, Tap,Drag Testing'),
        ),
        body: Column(
          children: [
            TextField(
              controller: editingController,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key('item_$index'),
                      onDismissed: (direction) => todos.removeAt(index),
                      background: Container(
                        color: Colors.green,
                      ),
                      child: ListTile(
                        title: Text(todos[index]),
                      ),
                    );
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: const Key('float_action'),
          onPressed: () {
            setState(() {
              todos.add(editingController.text);
              editingController.clear();
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
