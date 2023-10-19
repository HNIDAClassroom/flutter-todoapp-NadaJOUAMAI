import 'package:flutter/widgets.dart';
import 'package:login_app/model/task.dart';
import 'package:login_app/widgets/task_item.dart';

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  const TasksList({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) => TaskItem(tasks[index]));
  }
}
