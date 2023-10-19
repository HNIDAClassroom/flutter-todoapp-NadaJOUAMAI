import 'package:flutter/material.dart';
import 'package:login_app/model/task.dart';
import 'package:login_app/widgets/new_task.dart';
import 'package:login_app/widgets/tasks_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  List<Task> _registredTasks = [
    Task(
    title: 'Task 1',
    description: 'exemple of description of Task 1', 
    date: DateTime.now(),
    category: Category.personal
    ),
    Task(
    title: 'Task 2',
    description: 'exemple of description of Task 2', 
    date: DateTime.now(),
    category: Category.shopping
    ),
    Task(
    title: 'Task 3',
    description: 'exemple of description of Task 3', 
    date: DateTime.now(),
    category: Category.work
    ),
    ];
  
    void _openAddTaskOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const NewTask(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Center(child : Text('ToDoList App'),),
        actions: [
          IconButton(
          onPressed: _openAddTaskOverlay,
          icon: Ink(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
               color: Color.fromARGB(255, 143, 143, 193),
              ),
            child : const Padding (padding : EdgeInsets.all(10),
            child: Icon(Icons.add),
            ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
          Expanded(child: TasksList(tasks: _registredTasks)),],
        ),
      ),
    );
  }
}