import 'package:flutter/material.dart';
import 'package:login_app/model/task.dart';
import 'package:intl/intl.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});
  final void Function(Task task) onAddTask;
  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.personal;
  // ignore: unused_field
  var _enteredTitle = '';

  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();

    super.dispose();
  }

  void _submitTaskData() {
    if (_titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Erreur'),
          content: const Text(
              'Merci de saisir le titre de la tâche à ajouter dans la liste'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    print("Selected Category: $_selectedCategory");

    widget.onAddTask(Task(
        title: _titleController.text,
        description: _descriptionController.text,
        date: _selectedDate!, // Utilisez ! pour accéder à la valeur non nulle
        category: _selectedCategory));
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Task title'),
            ),
          ),
          TextField(
            controller: _descriptionController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Task description'),
            ),
          ),
          const SizedBox(width: 16),
          // Text field for entering the date
          InkWell(
            onTap: () => _selectDate(context),
            child: InputDecorator(
              decoration: InputDecoration(
                labelText: 'Task date',
                hintText: 'Sélectionnez une date',
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _selectedDate != null
                        ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                        : 'Sélectionnez une date',
                  ),
                  Icon(Icons.calendar_today),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              DropdownButton<Category>(
                value: _selectedCategory,
                style: TextStyle(color: Color.fromARGB(255, 12, 12, 12)),
                items: Category.values
                    .map((category) => DropdownMenuItem<Category>(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }

                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const SizedBox(width: 25),
              ElevatedButton(
                onPressed: _submitTaskData,
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                child: const Text('Enregistrer'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
