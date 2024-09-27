import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_bloc/todo_bloc/todo_event.dart';
import 'package:todo_bloc/todo_bloc/totdo_state.dart';

class TodoPage extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO LIST'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(
                labelText: 'Введіть завдання',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add_circle),
                  onPressed: () {
                   if (_taskController.text.isNotEmpty) {
                     context.read<TodoBloc>().add(AddTodo(_taskController.text));
                     _taskController.clear();
                   }
                  },
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is TodoLoaded) {
                    final tasks = state.tasks;
                    return ListView.builder(
                        itemCount: tasks.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(tasks[index]),
                          );
                        });
                  } else {
                    return const Center(
                      child: Text('задач нема!\nСтвори нову задачу'),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
